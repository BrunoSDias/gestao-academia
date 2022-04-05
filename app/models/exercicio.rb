class Exercicio < ApplicationRecord
  belongs_to :treino

  validates :nome, uniqueness: true, presence: true
  validates :descricao, presence: true

  has_many :exercicio_treino_clientes, dependent: :destroy
end
