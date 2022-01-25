class CreatePagamentos < ActiveRecord::Migration[5.2]
  def change
    create_table :pagamentos do |t|
      t.references :cliente, foreign_key: true
      t.datetime :prazo
      t.integer :status

      t.timestamps
    end
  end
end
