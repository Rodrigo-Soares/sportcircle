require 'test_helper'

class UserFriendshipTest < ActiveSupport::TestCase
	should belong_to(:user)
	should belong_to(:friend)

	test "That creating a friendship works without raising any exception" do
		assert_nothing_raised do
		  UserFriendship.create user: users(:rodrigo), friend: users(:caroline)
		end		
	end

	test "That creating a friendship based on id works" do
		UserFriendship.create user_id: users(:rodrigo).id , friend_id: users(:caroline).id
		assert users(:rodrigo).friends.include?(users(:caroline))
	end

end
