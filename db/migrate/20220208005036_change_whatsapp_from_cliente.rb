class ChangeWhatsappFromCliente < ActiveRecord::Migration[5.2]
  def up
    change_table :clientes do |t|
      t.change :whatsapp, :bigint
    end
  end

  def down
    change_table :clientes do |t|
      t.change :whatsapp, :integer
    end
  end
end
