namespace :exercicio do
  desc "Gera andamento de exercicios do dia"
  task gera_andamento: :environment do
    dia_semana = Time.zone.now.wday
    data_atual = Time.zone.now.beginning_of_day.utc

    exercicio_treino_cliente_ids = ExercicioTreinoCliente
    .joins(:treino_cliente)
    .where(
      treino_clientes: {
        dia_semana: dia_semana
      }
    )
    .where("
      (
        select count(andamento_exercicios.id) from andamento_exercicios
        where andamento_exercicios.exercicio_treino_cliente_id = exercicio_treino_clientes.id and
        andamento_exercicios.created_at = ?
      ) = 0
    ", data_atual)
    .distinct
    .pluck(:id)
    
    sql_query = ""
    if exercicio_treino_cliente_ids.present?
      exercicio_treino_cliente_ids.each do |exercicio_treino_cliente_id|
        sql_query += "INSERT INTO andamento_exercicios (exercicio_treino_cliente_id, status, created_at, updated_at) VALUES ('#{exercicio_treino_cliente_id}', '1', '#{data_atual}', '#{data_atual}'); "
      end

      ActiveRecord::Base.connection.execute(sql_query);
    end
  end

  desc "Exercicios não concluidos"
  task define_nao_concluidos: :environment do
    AndamentoExercicio
    .where("created_at < ?", Time.zone.now.beginning_of_day)
    .where.not(status: :realizado)
    .update_all(status: :nao_realizado)
  end
end
