require 'test_helper'

class TreinadorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @treinador = treinadors(:one)
  end

  test "should get index" do
    get treinadors_url
    assert_response :success
  end

  test "should get new" do
    get new_treinador_url
    assert_response :success
  end

  test "should create treinador" do
    assert_difference('Treinador.count') do
      post treinadors_url, params: { treinador: { email: @treinador.email, nome: @treinador.nome, password: @treinador.password, password_digest: @treinador.password_digest } }
    end

    assert_redirected_to treinador_url(Treinador.last)
  end

  test "should show treinador" do
    get treinador_url(@treinador)
    assert_response :success
  end

  test "should get edit" do
    get edit_treinador_url(@treinador)
    assert_response :success
  end

  test "should update treinador" do
    patch treinador_url(@treinador), params: { treinador: { email: @treinador.email, nome: @treinador.nome, password: @treinador.password, password_digest: @treinador.password_digest } }
    assert_redirected_to treinador_url(@treinador)
  end

  test "should destroy treinador" do
    assert_difference('Treinador.count', -1) do
      delete treinador_url(@treinador)
    end

    assert_redirected_to treinadors_url
  end
end
