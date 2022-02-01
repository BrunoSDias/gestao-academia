json.extract! treino_cliente, :id, :cliente_id, :treino_id, :dia_semana, :created_at, :updated_at
json.url treino_cliente_url(treino_cliente, format: :json)
