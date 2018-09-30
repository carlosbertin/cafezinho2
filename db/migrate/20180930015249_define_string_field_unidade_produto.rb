class DefineStringFieldUnidadeProduto < ActiveRecord::Migration[5.2]
  def change
    change_column :produtos, :unidade, :string
  end
end
