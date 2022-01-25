require 'test_helper'

class AdministradorControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get administrador_index_url
    assert_response :success
  end

end
