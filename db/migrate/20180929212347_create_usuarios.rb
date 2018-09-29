class CreateUsuarios < ActiveRecord::Migration[5.2]
  def change
    create_table :usuarios do |t|
      t.string :nome
      t.datetime :data_desativacao
      t.string :cpf

      t.timestamps
    end
  end
end
