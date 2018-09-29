class Produto < ApplicationRecord
    has_many :compras
    has_many :arrecadacao, through: :compras
end
