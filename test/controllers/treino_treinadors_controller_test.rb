require 'test_helper'

class TreinoTreinadorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get treino_treinadors_index_url
    assert_response :success
  end

end
