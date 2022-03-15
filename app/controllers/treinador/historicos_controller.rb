class Treinador::HistoricosController < Treinador::ApplicationController
  before_action :set_cliente, only: %i[ show ]

  def index
    @clientes = Cliente.joins(
      treino_clientes: [
        {
          treino: :treino_treinadors
        }
      ]
    )
    .where(treino_treinadors: { id: @current_user.id })
    .select([
      "clientes.id",
      "clientes.nome"
    ])
  end

  def show
    @andamento_exercicios = AndamentoExercicio
    .joins(
      exercicio_treino_cliente: [{
        treino_cliente:{
          treino: :treino_treinadors
        }
      }, :exercicio]
    )
    .where(
      treino_treinadors:
      {
        id: @current_user.id
      },
      treino_clientes:
      {
        cliente_id: @cliente.id
      }
    )
    .distinct
    .select([
      "andamento_exercicios.status",
      "exercicios.nome as nome_exercicio",
      "treinos.nome as nome_treino",
      "andamento_exercicios.created_at"
    ])
  end

  private
  def set_cliente
    @cliente = Cliente.find(params[:id])
  end
end
