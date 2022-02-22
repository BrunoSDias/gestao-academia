class Operador::ExercicioTreinoClientesController < Operador::ApplicationController
  before_action :set_cliente
  before_action :set_treino_cliente
  before_action :set_exercicio_treino_cliente, only: %i[ altera_ordem ]

  def index
    @exercicio_treino_clientes = ExercicioTreinoCliente
    .joins(:treino_cliente, :exercicio)
    .where(exercicio_treino_clientes: { treino_cliente_id: @treino_cliente.id })
    .select([
      "exercicio_treino_clientes.id",
      "treino_clientes.cliente_id",
      "exercicio_treino_clientes.treino_cliente_id",
      "exercicio_treino_clientes.exercicio_id",
      "exercicios.nome as nome_exercicio",
      "exercicio_treino_clientes.ordem"
    ])
  end

  def altera_ordem
    @exercicio_treino_cliente.update!(ordem: params[:ordem])
  rescue => erro
    render json: {message: erro.message }, status: :unauthorized
  end

  private
    def set_treino_cliente
      @treino_cliente = TreinoCliente.find(params[:treino_cliente_id])
    end

    def set_exercicio_treino_cliente
      @exercicio_treino_cliente = ExercicioTreinoCliente.find(params[:id])
    end
    
    def set_cliente
      @cliente_id = params[:cliente_id]
    end

    def set_exercicio_treino_cliente_params
      params.require(:exercicio_treino_cliente).permit(:treino_cliente_id, :exercicio_id, :ordem)
    end
end
