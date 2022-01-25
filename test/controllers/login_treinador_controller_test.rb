require 'test_helper'

class LoginTreinadorControllerTest < ActionDispatch::IntegrationTest
  test "should get signin" do
    get login_treinador_signin_url
    assert_response :success
  end

  test "should get access" do
    get login_treinador_access_url
    assert_response :success
  end

end
