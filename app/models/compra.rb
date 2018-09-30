class Compra < ApplicationRecord
    belongs_to :produto
    belongs_to :arrecadacao

    validates_numericality_of :preco, greater_than: 0, message: " - deve ser um número maior que 0"
    validates_numericality_of :quantidade, greater_than: 0, message: " - deve ser um número maior que 0"
end