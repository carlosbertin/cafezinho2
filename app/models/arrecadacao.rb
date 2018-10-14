class Arrecadacao < ApplicationRecord
    self.table_name = "arrecadacoes"
    
    has_many :arrecadamentos
    has_many :usuarios, through: :arrecadamentos

    # validates_presence_of :mes_ano, message: :mes_ano_deve_ser_selecionado
    # validates_uniqueness_of :mes_ano, message: :mes_ano_existente
    # validates_numericality_of :valor_base, :greater_than => 0, message: :valor_base_maior_que_zero
end
