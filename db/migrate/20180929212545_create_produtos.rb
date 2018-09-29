class CreateProdutos < ActiveRecord::Migration[5.2]
  def change
    create_table :produtos do |t|
      t.string :nome
      t.integer :unidade
      t.text :observacao

      t.timestamps
    end
  end
end
