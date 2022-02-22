class CreateExercicioTreinoClientes < ActiveRecord::Migration[5.2]
  def change
    create_table :exercicio_treino_clientes do |t|
      t.references :treino_cliente, foreign_key: true
      t.references :exercicio, foreign_key: true
      t.integer :ordem

      t.timestamps
    end
  end
end
