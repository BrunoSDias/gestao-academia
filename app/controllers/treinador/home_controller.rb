class Treinador::HomeController < Treinador::ApplicationController
  def index
    @clientes = Cliente
    .joins(treino_clientes: { treino: :treino_treinadors })
    .where(treino_treinadors: { treinador_id: @current_user.id })
    .distinct
    .select([
      "clientes.id",
      "clientes.nome"
    ])
  end
end