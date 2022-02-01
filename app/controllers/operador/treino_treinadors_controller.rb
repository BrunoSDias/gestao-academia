class Operador::TreinoTreinadorsController < Operador::ApplicationController
  layout 'treinador'
  
  before_action :set_treinador

  def index
  end

  private
  def set_treinador
    @treinador = Treinador.find_decoded(@current_user)
  end

  def treino_treinador_params
    params.require(:treino_treinador).permit(:treino_id)
  end
end
