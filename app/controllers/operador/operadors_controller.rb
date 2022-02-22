class Operador::OperadorsController < Operador::ApplicationController
  before_action :set_operador, only: %i[ show ]
  # GET /operadors/1 or /operadors/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_operador
      @operador = Operador.find(params[:id])
    end
end
