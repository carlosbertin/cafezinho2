class RelacionamentoArrecadamentos < ActiveRecord::Migration[5.2]
  def change
    add_reference :arrecadamentos, :usuario, index: true
    add_reference :arrecadamentos, :arrecadacao, index: true
  end
  # def self.up
  #   create_table :arrecadamentos do |t|
  #     t.references :usuario, :arrecadacao
  #     t.timestamps
  #   end
  # end

  # def self.down
  #   drop_table :arrecadamentos
  # end
end
