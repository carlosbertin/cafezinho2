class Arrecadamento < ApplicationRecord
    belongs_to :usuario
    belongs_to :arrecadacao
end
