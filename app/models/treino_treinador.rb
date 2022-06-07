class TreinoTreinador < ApplicationRecord
  belongs_to :treinador
  belongs_to :treino

  validates :treinador_id, uniqueness: { scope: [:treinador_id, :treino_id] }
end
