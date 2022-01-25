class Treinador < ApplicationRecord
  has_secure_password

  def self.find_decoded(id)
    find(JsonWebToken.decode(id)[:id])
  end
end
