class Treinador::AndamentoExerciciosController < Treinador::ApplicationController
  def index
    @andamento_exercicios = AndamentoExercicio
    .joins(exercicio_treino_cliente: :exercicio)
    .where(
      andamento_exercicios: {
        status: :em_andamento
      },
      exercicio_treino_clientes: {
        treino_cliente_id: params[:treino_cliente_id]
      }
    )
    .reorder("exercicio_treino_clientes.ordem ASC")
    .distinct
    .select([
      "andamento_exercicios.id",
      "exercicios.nome",
      "exercicio_treino_clientes.ordem"
    ])
  end
end
