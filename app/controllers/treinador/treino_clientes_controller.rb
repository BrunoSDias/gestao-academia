class Treinador::TreinoClientesController < Treinador::ApplicationController
  # GET /treino_clientes or /treino_clientes.json
  def index
    dia_semana = Time.zone.now.wday
    @treino_clientes = TreinoCliente
    .joins(treino: :treino_treinadors)
    .where(
      treino_clientes: {
        cliente_id: params[:cliente_id],
        dia_semana: dia_semana
      },
      treino_treinadors: {
        treinador_id: @current_user.id
      }
    )
    .distinct
    .select([
      "treino_clientes.id",
      "treino_clientes.treino_id",
      "treino_clientes.cliente_id",
      "treinos.nome"
    ])
  end
end
