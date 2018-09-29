class CreateArrecadacaos < ActiveRecord::Migration[5.2]
  def change
    create_table :arrecadacaos do |t|
      t.string :mes_ano
      t.float :valor_base

      t.timestamps
    end
  end
end
