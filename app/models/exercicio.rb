class Exercicio < ApplicationRecord
  belongs_to :treino

  has_many :exercicio_treino_clientes, dependent: :destroy
end
