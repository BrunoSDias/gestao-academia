class Operador < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true, presence: true
  validates :nome, presence: true

  def self.find_decoded(id)
    find(JsonWebToken.decode(id)[:id])
  end
end
