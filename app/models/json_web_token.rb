SECRET_KEY = Rails.application.secrets.secret_key_base

class JsonWebToken
  def self.encode(dado, exp = 1.year.from_now)
    dado[:exp] = exp.to_i
    JWT.encode(dado, SECRET_KEY)
  end

  def self.decode(dado)
    decoded = JWT.decode(dado, SECRET_KEY)[0]
    HashWithIndifferentAccess.new(decoded)
  end
end

