class CreateAndamentoExercicios < ActiveRecord::Migration[5.2]
  def change
    create_table :andamento_exercicios do |t|
      t.references :exercicio_treino_cliente, foreign_key: true
      t.integer :status
      t.string :mensagem

      t.timestamps
    end
  end
end
