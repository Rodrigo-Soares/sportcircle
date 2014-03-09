require 'test_helper'

class UserTest < ActiveSupport::TestCase

	should have_many(:user_friendships)
	should have_many(:friends)

	test "a user should have a first name." do 
		user = User.new
		assert !user.save
		assert !user.errors[:first_name].empty?
	end

	test "a user should have a last name." do 
		user = User.new
		assert !user.save
		assert !user.errors[:last_name].empty?
	end

	test "a user should have a profile name." do 
		user = User.new
		assert !user.save
		assert !user.errors[:profile_name].empty?
	end

	test "a user should have a unique profile name." do 
		user = User.new
		user.profile_name = users(:rodrigo).profile_name

		assert !user.save
		assert !user.errors[:profile_name].empty?

	end

	test "a profile name must be correctly formatted" do
		user = User.new
		user.profile_name = "Profile_@#{}name with spaces"

		assert !user.save
		assert !user.errors[:profile_name].empty?
		assert user.errors[:profile_name].include?("The profile name should be well formatted!")
	end

	test "That a no exception is raised when trying to access a user friend" do
       assert_nothing_raised do
       	users(:rodrigo).friends
       end
	end

	test "Assert that a friendship works on the user" do 
       users(:rodrigo).friends << users(:maria)
       users(:rodrigo).friends.reload
       assert users(:rodrigo).friends.include?(users(:maria))
	end

	test "that calling to_param in a user returns the profile_name" do
		assert_equal "Roderswiss", users(:rodrigo).to_param 
	end

end
