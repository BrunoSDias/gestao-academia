json.extract! endereco, :id, :cliente_id, :rua, :estado_id, :cep, :cidade, :complemento, :numero, :bairro, :created_at, :updated_at
json.url endereco_url(endereco, format: :json)
