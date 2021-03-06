require 'test_helper'

class StatusesControllerTest < ActionController::TestCase
  setup do
    @status = statuses(:one)
  end


  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:statuses)
  end


  test "should not get new status when not logged in" do
    get :new
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end


  test 'should render the new page when logged in' do 
  
  sign_in users(:rodrigo)
  get :new

  assert_response :success

  end


  test "should not post new status when not logged in" do
  
  post :create, status: { content: "Hello" }
  assert_response :redirect
  
  assert_redirected_to new_user_session_path

  end


  test "should get to edit status when logged in" do
  
  sign_in users(:rodrigo)
  get :edit, id: @status
  assert_response :success

  end


  test "should be redirected when tryint to edit status and not logged in" do
  
  get :edit, id: @status
  assert_response :redirect
  assert_redirected_to new_user_session_path

  end


  test "should create status only when logged in" do

    sign_in users(:rodrigo)

    assert_difference('Status.count') do
      post :create, status: { content: @status.content }
    end

    assert_redirected_to status_path(assigns(:status))
  end


  test "should create status for the current user when logged in" do

    sign_in users(:rodrigo)

    assert_difference('Status.count') do
      post :create, status: { content: @status.content, user_id: users(:caroline).id }
    end

    assert_redirected_to status_path(assigns(:status))
    assert_equal assigns(:status).user_id, users(:rodrigo).id
  end


  test "should show status" do
    get :show, id: @status
    assert_response :success
  end


  test "should be logged in to update status" do
    sign_in users(:rodrigo)
    patch :update, id: @status, status: { content: @status.content }
    assert_redirected_to status_path(assigns(:status))
  end


  test "should be the current user and logged in to update status" do

    sign_in users(:rodrigo)
    patch :update, id: @status, status: { content: @status.content, user_id: users(:caroline).id }
    
    assert_redirected_to status_path(assigns(:status))
    assert_equal assigns(:status).user_id, users(:rodrigo).id
  end


  test "Should be redirected when trying to update but not logged in" do
    patch :update, id: @status, status: { content: @status.content }
    assert_response :redirect
    assert_redirected_to new_user_session_path

  end

  test "should destroy status" do
    assert_difference('Status.count', -1) do
      delete :destroy, id: @status
    end

    assert_redirected_to statuses_path
  end
end
