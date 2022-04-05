class User < ApplicationRecord
  validates :nome, :whatsapp, uniqueness: true, presence: true
end
