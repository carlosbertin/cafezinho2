class Compra < ApplicationRecord
    belongs_to :produto
    belongs_to :arrecadacao

    validates_numericality_of :preco, greater_than: 0, message: " - deve ser um número maior que 0"
    validates_numericality_of :quantidade, greater_than: 0, message: " - deve ser um número maior que 0"
    
    # Com o delegate eu consigo acessar métodos ou atributos de outros modelos. 
    # No caso de Produto.
    delegate :nome, to: :produto
    delegate :unidade, to: :produto, :allow_nil => true
    delegate :observacao, to: :produto, :allow_nil => true

    # Com o delegate eu consigo acessar métodos ou atributos de outros modelos. 
    # No caso de Arrecadacao.
    delegate :mes_ano, to: :arrecadacao
    delegate :valor_base, to: :arrecadacao

end