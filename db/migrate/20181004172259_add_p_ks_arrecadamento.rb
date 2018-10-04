class AddPKsArrecadamento < ActiveRecord::Migration[5.2]
  def change
    add_index :arrecadamentos, [:usuario_id, :arrecadacao_id], unique: true
  end
end
