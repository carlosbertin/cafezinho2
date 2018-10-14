class Compra < ApplicationRecord
    belongs_to :produto
    belongs_to :arrecadacao

    # Criando um filtro por mes_ano na tela lista de Compras
    def self.search(search)
        if search.to_i > 0
            where(['arrecadacao_id = ?', search])
        else
            all
        end
     end


    # validates :arrecadacao_id, uniqueness: { scope: :produto_id, message: :compra_ja_registrada }
    # validates_numericality_of :preco, :greater_than => 0, message: :preco_maior_que_zero
    # validates_numericality_of :quantidade, :greater_than => 0, message: :quantidade_maior_que_zero
    # validates_presence_of :data_compra, message: :data_compra_preenchida

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