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

	     	get :new, friend_id: users(:caroline).id
	     	assert_match /#{users(:caroline).full_name}/, response.body 

	     	end

	     end
	   end
end
