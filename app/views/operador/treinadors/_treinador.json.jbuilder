json.extract! treinador, :id, :nome, :email, :password, :password_digest, :created_at, :updated_at
json.url treinador_url(treinador, format: :json)
