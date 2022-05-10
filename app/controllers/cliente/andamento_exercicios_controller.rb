class Cliente::AndamentoExerciciosController < Cliente::ApplicationController
  before_action :set_andamento_exercicio, only: [:update_status]

  def update_status
    if @andamento_exercicio.update(status: params[:status].to_i)
      render json: {}, status: :ok
    end
  end

  private
   def set_andamento_exercicio
    @andamento_exercicio = AndamentoExercicio.find(params[:id] || params[:andamento_exercicio_id])
   end
end
