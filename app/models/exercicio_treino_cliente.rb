class ExercicioTreinoCliente < ApplicationRecord
  belongs_to :treino_cliente
  belongs_to :exercicio

  has_many :andamento_exercicios, dependent: :destroy

  validate :ordem_unica?

  private
    def ordem_unica?
      errors.add(:base, "Posição ja está preenchida") if ExercicioTreinoCliente
      .where(treino_cliente_id: self.treino_cliente_id, ordem: self.ordem)
      .where
      .not(id: self.id)
      .present?
    end
end
