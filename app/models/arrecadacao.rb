class Arrecadacao < ApplicationRecord
    self.table_name = "arrecadacoes"
    
    has_many :arrecadamentos
    has_many :usuarios, through: :arrecadamentos

    validates_presence_of :mes_ano, message: "deve ser selecionado"
    validates_uniqueness_of :mes_ano, message: " - Mês/Ano já cadastrado"
end
