require 'test_helper'

class Treinador::HistoricosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get treinador_historicos_index_url
    assert_response :success
  end

  test "should get show" do
    get treinador_historicos_show_url
    assert_response :success
  end

end
