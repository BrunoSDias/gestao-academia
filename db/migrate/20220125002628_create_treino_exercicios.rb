class CreateTreinoExercicios < ActiveRecord::Migration[5.2]
  def change
    create_table :treino_exercicios do |t|
      t.references :treino, foreign_key: true
      t.references :exercicio, foreign_key: true

      t.timestamps
    end
  end
end
