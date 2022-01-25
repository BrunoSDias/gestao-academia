class CreateTreinoTreinadors < ActiveRecord::Migration[5.2]
  def change
    create_table :treino_treinadors do |t|
      t.references :treinador, foreign_key: true
      t.references :treino, foreign_key: true

      t.timestamps
    end
  end
end
