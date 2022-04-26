class AddEmailAndPasswordToCliente < ActiveRecord::Migration[5.2]
  def change
    add_column :clientes, :email, :string
    add_column :clientes, :password, :string
  end
end
