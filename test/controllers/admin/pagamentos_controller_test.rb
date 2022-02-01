require 'test_helper'

class Administrador::PagamentosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_pagamentos_index_url
    assert_response :success
  end

end
