class AndamentoExercicio < ApplicationRecord
  belongs_to :exercicio_treino_cliente

  enum status: {
    nao_realizado: 0,
    em_andamento: 1,
    realizado: 2
  }
end
