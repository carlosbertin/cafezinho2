class CreateCompras < ActiveRecord::Migration[5.2]
  def change
    create_table :compras do |t|
      t.float :preco
      t.integer :quantidade

      t.timestamps
    end
  end
end
