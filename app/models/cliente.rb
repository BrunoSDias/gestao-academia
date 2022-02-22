class Cliente < ApplicationRecord
  has_many :treino_clientes, dependent: :destroy
  has_one :pagamento, dependent: :destroy

  accepts_nested_attributes_for :pagamento
end
