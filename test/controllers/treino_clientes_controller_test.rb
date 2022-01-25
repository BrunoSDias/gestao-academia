require 'test_helper'

class TreinoClientesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @treino_cliente = treino_clientes(:one)
  end

  test "should get index" do
    get treino_clientes_url
    assert_response :success
  end

  test "should get new" do
    get new_treino_cliente_url
    assert_response :success
  end

  test "should create treino_cliente" do
    assert_difference('TreinoCliente.count') do
      post treino_clientes_url, params: { treino_cliente: { cliente_id: @treino_cliente.cliente_id, dia_semana: @treino_cliente.dia_semana, treino_id: @treino_cliente.treino_id } }
    end

    assert_redirected_to treino_cliente_url(TreinoCliente.last)
  end

  test "should show treino_cliente" do
    get treino_cliente_url(@treino_cliente)
    assert_response :success
  end

  test "should get edit" do
    get edit_treino_cliente_url(@treino_cliente)
    assert_response :success
  end

  test "should update treino_cliente" do
    patch treino_cliente_url(@treino_cliente), params: { treino_cliente: { cliente_id: @treino_cliente.cliente_id, dia_semana: @treino_cliente.dia_semana, treino_id: @treino_cliente.treino_id } }
    assert_redirected_to treino_cliente_url(@treino_cliente)
  end

  test "should destroy treino_cliente" do
    assert_difference('TreinoCliente.count', -1) do
      delete treino_cliente_url(@treino_cliente)
    end

    assert_redirected_to treino_clientes_url
  end
end
