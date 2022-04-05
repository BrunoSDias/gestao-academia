class Endereco < ApplicationRecord
  belongs_to :cliente

  validates rua, cep, estado, cidade, numero, bairro, presence: true
end
