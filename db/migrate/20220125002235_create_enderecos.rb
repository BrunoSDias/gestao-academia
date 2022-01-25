class CreateEnderecos < ActiveRecord::Migration[5.2]
  def change
    create_table :enderecos do |t|
      t.references :cliente, foreign_key: true
      t.string :rua
      t.integer :cep
      t.string :estado
      t.string :cidade
      t.string :complemento
      t.string :numero
      t.string :bairro

      t.timestamps
    end
  end
end
