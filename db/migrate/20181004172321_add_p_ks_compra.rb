class AddPKsCompra < ActiveRecord::Migration[5.2]
  def change
    add_index :compras, [:produto_id, :arrecadacao_id], unique: true
  end
end
