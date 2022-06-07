class Cliente < ApplicationRecord
  include BCrypt

  has_many :treino_clientes, dependent: :destroy
  has_one :pagamento, dependent: :destroy

  validates :nome, :whatsapp, :email, presence: true

  accepts_nested_attributes_for :pagamento

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def encoded
    res = self.as_json
    res['decoded_id'] = res['id']
    res['id'] = JsonWebToken.encode({id: res['id']})
    res
  end
end
