class TreinoCliente < ApplicationRecord
  belongs_to :cliente
  belongs_to :treino

  enum dia_semana: {
    1: "domingo",
    2: "segunda",
    3: "terca",
    4: "quarta",
    5: "quinta",
    6: "sexta",
    7: "sabado"
  }
end
