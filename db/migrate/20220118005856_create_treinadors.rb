class CreateTreinadors < ActiveRecord::Migration[5.2]
  def change
    create_table :treinadors do |t|
      t.string :nome, null: false
      t.string :email, null: false
      t.string :password
      t.string :password_digest

      t.timestamps
    end
  end
end
