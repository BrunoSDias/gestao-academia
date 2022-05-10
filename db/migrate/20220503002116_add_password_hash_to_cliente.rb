class AddPasswordHashToCliente < ActiveRecord::Migration[5.2]
  def change
    add_column :clientes, :password_hash, :string
  end
end
