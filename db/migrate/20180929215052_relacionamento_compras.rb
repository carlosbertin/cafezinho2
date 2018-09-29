class RelacionamentoCompras < ActiveRecord::Migration[5.2]
  def change
    add_reference :compras, :produto, index: true
    add_reference :compras, :arrecadacao, index: true
  end
  # def self.up
  #   create_table :compras do |t|
  #     t.references :produto, :arrecadacao
  #     t.timestamps
  #   end
  # end

  # def self.down
  #   drop_table :compras
  # end
end
