class CreateTreinoClientes < ActiveRecord::Migration[5.2]
  def change
    create_table :treino_clientes do |t|
      t.references :cliente, foreign_key: true
      t.references :treino, foreign_key: true
      t.integer :dia_semana

      t.timestamps
    end
  end
end
