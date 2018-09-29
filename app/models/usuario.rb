class Usuario < ApplicationRecord
    has_many :arrecadamentos
    has_many :arrecadacoes, through: :arrecadamentos
end
