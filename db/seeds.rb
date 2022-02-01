if Operador.create(
  nome: "Bruno",
  email: "bruno@administrador.com",
  password: "123456",
  administrador: true
)
  puts "Administrador criado com sucesso"
end

if Operador.create(
  nome: "Bruno",
  email: "bruno@operador.com",
  password: "123456",
  administrador: false
)
  puts "Operador criado com sucesso"
end

if Treinador.create(
  nome: "Bruno",
  email: "bruno@treinador.com",
  password: "123456"
)
  puts "Treinador criado com sucesso"
end
