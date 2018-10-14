class Arrecadamento < ApplicationRecord
    belongs_to :usuario
    belongs_to :arrecadacao

    #validates_numericality_of :valor_pago, :greater_than => 0, message: :valor_pago_maior_que_zero

end
