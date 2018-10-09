class AddDataCompraCompra < ActiveRecord::Migration[5.2]
  def change
    add_column :compras, :data_compra, :datetime
  end
end
