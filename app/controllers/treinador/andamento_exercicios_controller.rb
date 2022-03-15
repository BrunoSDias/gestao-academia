class Treinador::AndamentoExerciciosController < Treinador::ApplicationController
  before_action :set_andamento_exercicio, only: [:update_status]

  def index
    data_atual = Time.zone.now.beginning_of_day.utc

    @treino_cliente = TreinoCliente.find(params[:treino_cliente_id])
    @andamento_exercicios = AndamentoExercicio
    .joins(exercicio_treino_cliente: [:treino_cliente, :exercicio])
    .where(
      exercicio_treino_clientes: {
        treino_cliente_id: params[:treino_cliente_id]
      }
    )
    .where("andamento_exercicios.created_at >= ?", data_atual)
    .reorder("exercicio_treino_clientes.ordem ASC")
    .distinct
    .select([
      "andamento_exercicios.id",
      "andamento_exercicios.status",
      "exercicios.nome",
      "exercicios.descricao",
      "exercicio_treino_clientes.ordem"
    ])
  end

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
