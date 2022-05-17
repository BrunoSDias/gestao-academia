json.treinos do
  json.array! @treinos, partial: 'cliente/historicos/treino', as: :treino
end

json.exercicios do
  json.array! @exercicios, partial: 'cliente/historicos/exercicio', as: :exercicio
end

json.andamento_exercicios do
  json.array! @andamento_exercicios, partial: 'cliente/historicos/andamento_exercicio', as: :andamento_exercicio
end