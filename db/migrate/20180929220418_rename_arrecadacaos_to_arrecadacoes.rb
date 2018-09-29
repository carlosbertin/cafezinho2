class RenameArrecadacaosToArrecadacoes < ActiveRecord::Migration[5.2]
  def change
    rename_table :arrecadacaos, :arrecadacoes
  end
end
