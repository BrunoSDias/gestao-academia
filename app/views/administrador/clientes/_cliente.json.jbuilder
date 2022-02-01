json.extract! cliente, :id, :nome, :whatsapp, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
