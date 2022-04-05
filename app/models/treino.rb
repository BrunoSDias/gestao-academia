class Treino < ApplicationRecord
  has_many :treino_clientes, dependent: :destroy
  has_many :treino_treinadors, dependent: :destroy

  validates :nome, uniqueness: true, presence: true
end
