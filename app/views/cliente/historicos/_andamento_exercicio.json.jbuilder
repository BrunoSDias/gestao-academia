json.extract! andamento_exercicio, :status, :nome_exercicio, :nome_treino
json.created_at andamento_exercicio.created_at.strftime("%d/%m/%Y")