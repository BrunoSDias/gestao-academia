class TreinoCliente < ApplicationRecord
  belongs_to :cliente
  belongs_to :treino

  validate :unico_por_cliente!

  enum dia_semana: {
    domingo: 0,
    segunda: 1,
    terca: 2,
    quarta: 3,
    quinta: 4,
    sexta: 5,
    sabado: 6,
  }

  private

    def unico_por_cliente!
      if self.id
        if TreinoCliente.where(
            cliente_id: self.cliente_id,
            treino_id: self.treino_id,
            dia_semana: self.dia_semana,
          )
          .where.not(id: self.id)
          .count
          .positive?
            errors.add(:base, message: "Cliente não pode ter mais de um mesmo treino")
        end
      else
        if TreinoCliente.where(
          cliente_id: self.cliente_id,
          treino_id: self.treino_id,
          dia_semana: self.dia_semana
        )
        .count
        .positive?
          errors.add(:base, message: "Cliente não pode ter mais de um mesmo treino")
        end
      end
    end
end
