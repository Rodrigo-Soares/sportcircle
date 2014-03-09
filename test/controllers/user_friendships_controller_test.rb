require 'test_helper'

class UserFriendshipsControllerTest < ActionController::TestCase

	   context "#new" do
	     context "when user is not logged in" do
	       should "Redirect user to the login page" do 
	       	  get :new
	       	  assert_response :redirect
	       end
	   	 end
	    

	     context "when user is logged in" do
	     	
	     	setup do 
	     		sign_in users(:rodrigo)
	     	end

	     	should "get new and assert success" do 
	     		get :new
	     		assert_response :success
	     	end

	     	should "Get an error message flash if friend_id is missing." do 
	     		get :new, {}
	     		assert_equal "Friend id is missing.", flash[:error]
	     	end

	     	should "Display the friend's full name" do

	     	get :new, friend_id: users(:caroline)
	     	assert_match /#{users(:caroline).full_name}/, response.body 

	     	end

	     	should "assign a new user friendship" do
	     		get :new, friend_id: users(:caroline)
	     		assert assigns(:user_friendship)
	     	end

	     	should "assign a new user friendship correctly to the new friend" do
	     		get :new, friend_id: users(:caroline)
	     		assert_equal users(:caroline), assigns(:user_friendship).friend
	     	end

	     	should "assign a new user friendship correctly to the current logged in user" do
	     		get :new, friend_id: users(:caroline)
	     		assert_equal users(:rodrigo), assigns(:user_friendship).user
	     	end

	     	should "Render a 404 page if friend can't be found" do
	     		get :new, friend_id: 'invalid'
	     		assert_response :not_found
	     	end
	     	should "Ask if really want to add the friendship" do 
	     		get :new, friend_id: users(:caroline)
	     		assert_match /Do you really want to friend #{users(:caroline).full_name}?/, response.body
	     	end
	     end
	   end
end
