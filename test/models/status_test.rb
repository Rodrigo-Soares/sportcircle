require 'test_helper'

class StatusTest < ActiveSupport::TestCase

	test "A status should have content" do
		status = Status.new
		assert !status.save
		assert !status.errors[:content].empty?
	end

	test "The content should be at least 2 chars long." do 
		status = Status.new
		status.content = "H"
		assert !status.save
		assert !status.errors[:content].empty?

	end

	test "A post should have a user id" do
      status = Status.new
      assert !status.save
      assert !status.errors[:user_id].empty?
	end

end
