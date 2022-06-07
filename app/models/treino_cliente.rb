class TreinoCliente < ApplicationRecord
  belongs_to :cliente
  belongs_to :treino

  has_many :exercicio_treino_clientes, dependent: :destroy

  validate :unico_por_cliente!

  enum dia_semana: {
    domingo: 0,
    segunda: 1,
    terca: 2,
    quarta: 3,
    quinta: 4,
    sexta: 5,
    sabado: 6,
  }

  def treinadors
    Treinador
      .joins(:treino_treinadors)
      .where(treino_treinadors: { treino_id: treino_id })
      .distinct
      .pluck(:nome)
  end

  def exercicios_em_progresso
    data_atual = Time.zone.now.beginning_of_day.utc

    AndamentoExercicio
    .joins(exercicio_treino_cliente: [:treino_cliente, :exercicio])
    .where(
      exercicio_treino_clientes: {
        treino_cliente_id: self.id
      }
    )
    .where("andamento_exercicios.created_at >= ?", data_atual)
    .reorder("exercicio_treino_clientes.ordem ASC")
    .distinct
    .select([
      "andamento_exercicios.id",
      "andamento_exercicios.status",
      "exercicios.nome",
      "exercicios.descricao",
      "exercicio_treino_clientes.ordem"
    ])
  end

  private

    def unico_por_cliente!
      if self.id
        if TreinoCliente.where(
            cliente_id: self.cliente_id,
            treino_id: self.treino_id,
            dia_semana: self.dia_semana,
          )
          .where.not(id: self.id)
          .count
          .positive?
            errors.add(:base, message: "Cliente não pode ter mais de um mesmo treino")
        end
      else
        if TreinoCliente.where(
          cliente_id: self.cliente_id,
          treino_id: self.treino_id,
          dia_semana: self.dia_semana
        )
        .count
        .positive?
          errors.add(:base, message: "Cliente não pode ter mais de um mesmo treino")
        end
      end
    end
end
