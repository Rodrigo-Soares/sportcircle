require 'test_helper'

class UserTest < ActiveSupport::TestCase
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

end
