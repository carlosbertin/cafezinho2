class Arrecadamento < ApplicationRecord
    belongs_to :usuario
    belongs_to :arrecadacao

    #validates :valor_pago, numericality: { greater_than: 0 , message: '- deverá ser maior que 0 (zero).'}
    validates_numericality_of :valor_pago, :greater_than => 0, message: :valor_pago_maior_que_zero

    # Neste código está sendo feito um join com o modelo Arrecadacao, onde já é passado como
    # parâmetro/filtro o mês e ano atuais através de um alias "arrecadacao_atual".
    # scope :por_arrecadacoes_atuais, -> do
    #   joins(:arrecadacao).merge(Arrecadacao.arrecadacao_atual)
    # end

    # Com o delegate eu consigo acessar métodos ou atributos de outros modelos. 
    # No caso de Arrecadacao.
    #delegate :mes_ano, to: :arrecadacao
    # delegate :cpf, :nome, to: :usuario

    # O método abaixo foi criado para que seja possível passar o parâmetro
    # que compõem a chave primária da tabela UsuarioArrecadacao
    # http://localhost:3000/arrecadacoes/1/usuarios_arrecadacoes/new?usuario_id=1
    # def to_param
    #     'usuario_id'
    # end
end
