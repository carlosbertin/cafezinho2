class Produto < ApplicationRecord
    has_many :compras
    has_many :arrecadacao, through: :compras

    validates_presence_of :nome, message: "deve ser preenchido"
    validates_uniqueness_of :nome, message: " - nome já cadastrado"
    validates_presence_of :unidade, message: "deve ser preenchido"
end
