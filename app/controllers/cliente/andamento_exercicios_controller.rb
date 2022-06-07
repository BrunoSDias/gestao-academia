class Cliente::AndamentoExerciciosController < Cliente::ApplicationController
  before_action :set_andamento_exercicio, only: [:update_status]

  def update_status
    if @andamento_exercicio.update(status: params[:status].to_sym)
      ActionCable.server.broadcast("progresso_treino_#{@current_user.id}", treinos_dia)

      render json: {}, status: :ok
    end
  end

  private
   def treinos_dia
    data_atual = Time.zone.now.wday

    treino_clientes = TreinoCliente
      .includes(treino: { treino_treinadors: :treinador })
      .where(treino_clientes: { dia_semana: data_atual, cliente_id: @current_user.id })
    
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
