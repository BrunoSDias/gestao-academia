class TreinoCliente < ApplicationRecord
  belongs_to :cliente
  belongs_to :treino

  enum dia_semana: {
    domingo: 1,
    segunda: 2,
    terca: 3,
    quarta: 4,
    quinta: 5,
    sexta: 6,
    sabado: 7,
  }
end
