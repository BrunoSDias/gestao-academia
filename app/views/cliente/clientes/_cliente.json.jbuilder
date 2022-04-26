json.extract! cliente, :nome, :whatsapp, :email, :created_at, :updated_at
json.id JsonWebToken.encode({id: cliente.id})
