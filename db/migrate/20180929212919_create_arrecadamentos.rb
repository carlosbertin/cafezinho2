class CreateArrecadamentos < ActiveRecord::Migration[5.2]
  def change
    create_table :arrecadamentos do |t|
      t.float :valor_pago

      t.timestamps
    end
  end
end
