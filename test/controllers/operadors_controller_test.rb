require 'test_helper'

class OperadorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @operador = operadors(:one)
  end

  test "should get index" do
    get operadors_url
    assert_response :success
  end

  test "should get new" do
    get new_operador_url
    assert_response :success
  end

  test "should create operador" do
    assert_difference('Operador.count') do
      post operadors_url, params: { operador: { administrador: @operador.administrador, email: @operador.email, nome: @operador.nome, password: @operador.password, password_digest: @operador.password_digest } }
    end

    assert_redirected_to operador_url(Operador.last)
  end

  test "should show operador" do
    get operador_url(@operador)
    assert_response :success
  end

  test "should get edit" do
    get edit_operador_url(@operador)
    assert_response :success
  end

  test "should update operador" do
    patch operador_url(@operador), params: { operador: { administrador: @operador.administrador, email: @operador.email, nome: @operador.nome, password: @operador.password, password_digest: @operador.password_digest } }
    assert_redirected_to operador_url(@operador)
  end

  test "should destroy operador" do
    assert_difference('Operador.count', -1) do
      delete operador_url(@operador)
    end

    assert_redirected_to operadors_url
  end
end
