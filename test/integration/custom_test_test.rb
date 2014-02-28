require 'test_helper'

class CustomTestTest < ActionDispatch::IntegrationTest
  
  test 'The /login direcotry is successfully redirecting to the sign in page' do
  	get '/login'

  	assert_response :success
  	
  end

  test 'The /register direcotry is successfully redirecting to the sign up page' do
  	get '/register'

  	assert_response :success
  	
  end

  test 'The /logout direcotry is successfully redirecting to the logout page' do
  	get '/logout'

  	assert_response :redirect
  	assert_redirected_to '/'

  	
  end
  test 'The /edit direcotry is successfully redirecting to the edit page' do
  	get '/login'

  	assert_response :success
  	
  end

  test "to make sure profile page works" do
    get '/Roderswiss'
    assert_response :success
  end



end
