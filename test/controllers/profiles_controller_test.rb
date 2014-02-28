require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: users(:rodrigo).profile_name
    assert_response :success
    assert_template 'profiles/show'
  end

  test "shoulde render a 404 on profile not found" do
  	get :show, id: 'Does not exist.'
  	assert_response :not_found
  end

  test "Should correctly assign users variables" do
  	get :show, id: users(:rodrigo).profile_name
  	assert assigns(:user)
  	assert_not_empty assigns(:statuses)
  end

  test "Only users statuses must be shown to his profile page" do
  	get :show, id: users(:rodrigo).profile_name
  	assigns(:statuses).each do |status|
  		assert_equal users(:rodrigo), status.user
  	end
  end

end
