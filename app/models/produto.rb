class Produto < ApplicationRecord
    has_many :compras
    has_many :arrecadacao, through: :compras

    validates_presence_of :nome, message: :nome_deve_ser_preenchido
    validates_uniqueness_of :nome, message: :nome_existente
    validates_presence_of :unidade, message: :unidade_deve_ser_preenchida
end
