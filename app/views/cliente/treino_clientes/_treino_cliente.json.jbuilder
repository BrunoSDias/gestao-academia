json.extract! treino_cliente, :id, :treino_id, :cliente_id, :nome
json.andamento_exercicios treino_cliente.exercicios_em_progresso
json.treinadors treino_cliente.treinadors