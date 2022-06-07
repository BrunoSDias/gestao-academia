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
    if @andamento_exercicio.update(status: params[:status].to_sym)
      cliente_id = TreinoCliente
        .joins(exercicio_treino_clientes: :andamento_exercicios)
        .find_by(andamento_exercicios: { id: @andamento_exercicio.id })
        .cliente_id

      result = treinos_dia(cliente_id)
      ActionCable.server.broadcast("progresso_treino_#{cliente_id}", result)

      render json: {}, status: :ok
    end
  end

  private
    def treinos_dia(cliente_id)
      data_atual = Time.zone.now.wday

      treino_clientes = TreinoCliente
        .includes(treino: { treino_treinadors: :treinador })
        .where(treino_clientes: { dia_semana: data_atual, cliente_id: cliente_id })
      
      treino_clientes.map do |treino_cliente|
        treino_cliente.slice(:id, :treino_id, :cliente_id)
          .merge({ nome: treino_cliente.treino.nome })
          .merge({ andamento_exercicios: treino_cliente.exercicios_em_progresso })
          .merge({ treinadors: treino_cliente.treinadors })
      end
    end

    def set_andamento_exercicio
      @andamento_exercicio = AndamentoExercicio.find(params[:id] || params[:andamento_exercicio_id])
    end
end
