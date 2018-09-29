class Arrecadacao < ApplicationRecord
    has_many :arrecadamentos
    has_many :usuarios, through: :arrecadamentos
end
