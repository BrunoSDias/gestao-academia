require 'test_helper'

class Operador::ExercicioTreinoClientesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get operador_exercicio_treino_clientes_index_url
    assert_response :success
  end

  test "should get altera_ordem" do
    get operador_exercicio_treino_clientes_altera_ordem_url
    assert_response :success
  end

end
