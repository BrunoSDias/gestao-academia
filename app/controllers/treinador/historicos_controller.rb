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
    @treinos = Treino
    .joins(:treino_clientes)
    .where(
      treino_clientes: {
        cliente_id: @cliente.id
      }
    )
    .distinct
    .select([
      "treinos.id",
      "treinos.nome"
    ])

    @exercicios = Exercicio
    .joins(exercicio_treino_clientes: :treino_cliente)
    .where(
      treino_clientes: {
        cliente_id: @cliente.id
      }
    )
    .distinct
    .select([
      "exercicios.id",
      "exercicios.nome"
    ])

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

    if params[:treino_id].present?
      @andamento_exercicios = @andamento_exercicios.where(treino_clientes: { treino_id: params[:treino_id] })
    end

    if params[:exercicio_id].present?
      @andamento_exercicios = @andamento_exercicios.where(exercicio_treino_clientes: { exercicio_id: params[:exercicio_id] })
    end

    if params[:status].present?
      @andamento_exercicios = @andamento_exercicios.where(andamento_exercicios: { status: params[:status] })
    end

    if params[:dia_semana].present?
      @andamento_exercicios = @andamento_exercicios.where(treino_clientes: { dia_semana: params[:dia_semana] })
    end

    if params[:data_de].present?
      @andamento_exercicios = @andamento_exercicios.where("andamento_exercicios.created_at >= ?", Time.zone.parse(params[:data_de]).beginning_of_day)
    end

    if params[:data_ate].present?
      @andamento_exercicios = @andamento_exercicios.where("andamento_exercicios.created_at <= ?", Time.zone.parse(params[:data_ate]).beginning_of_day)
    end

    
    @andamento_exercicios = @andamento_exercicios
    .select([
      "andamento_exercicios.status",
      "exercicios.nome as nome_exercicio",
      "treinos.nome as nome_treino",
      "andamento_exercicios.created_at"
    ])

    @andamento_exercicios = @andamento_exercicios.paginate(page: params[:page] || 1, per_page: 5)
  end

  private
  def set_cliente
    @cliente = Cliente.find(params[:id])
  end
end
