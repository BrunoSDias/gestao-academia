class Cliente < ApplicationRecord
  has_many :treino_clientes, dependent: :destroy
  has_one :pagamento, dependent: :destroy

  validates :nome, :whatsapp, presence: true

  accepts_nested_attributes_for :pagamento

  def encoded
    res = self.as_json
    res['id'] = JsonWebToken.encode({id: res['id']})
    res
  end
end
