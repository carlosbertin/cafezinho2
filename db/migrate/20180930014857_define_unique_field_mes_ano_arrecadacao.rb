class DefineUniqueFieldMesAnoArrecadacao < ActiveRecord::Migration[5.2]
  def change
    add_index :arrecadacoes, :mes_ano, unique: true
  end
end
