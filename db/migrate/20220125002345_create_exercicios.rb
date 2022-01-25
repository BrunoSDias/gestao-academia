class CreateExercicios < ActiveRecord::Migration[5.2]
  def change
    create_table :exercicios do |t|
      t.references :treino, foreign_key: true
      t.string :nome
      t.text :descricao

      t.timestamps
    end
  end
end
