json.extract! cliente, :nome, :whatsapp, :email, :created_at, :updated_at
json.decoded_id cliente.id
json.id JsonWebToken.encode({id: cliente.id})
