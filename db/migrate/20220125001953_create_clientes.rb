class CreateClientes < ActiveRecord::Migration[5.2]
  def change
    create_table :clientes do |t|
      t.string :nome
      t.integer :whatsapp

      t.timestamps
    end
  end
end
