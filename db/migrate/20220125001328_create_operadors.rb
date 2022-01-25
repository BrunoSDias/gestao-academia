class CreateOperadors < ActiveRecord::Migration[5.2]
  def change
    create_table :operadors do |t|
      t.string :nome
      t.string :email
      t.string :password
      t.string :password_digest
      t.boolean :administrador

      t.timestamps
    end
  end
end
