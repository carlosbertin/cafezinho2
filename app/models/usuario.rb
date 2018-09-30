class Usuario < ApplicationRecord
    has_many :arrecadamentos
    has_many :arrecadacoes, through: :arrecadamentos

    # criar dois scopos: um para lista de usuários pendente pagamento e outra usuários que pagaram
    #scope :usuario_pendente_pagamento, -> { joins().where('valor_pago = ?', 0) }
    scope :usuario_pendente_pagamento, -> mes_ano do
        left_outer_joins(:arrecadamentos, :arrecadacoes).
        select('usuarios.*, arrecadamentos.valor_pago as valor_pago')#.
        #where.not(id: self.usuario_com_pagamento(mes_ano).pluck(:id))
    end

    #scope :usuario_pagamento_ok, -> { where.not(id: Usuario.usuario_pendente_pagamento.pluck(:id)) }
    scope :usuario_com_pagamento, -> mes_ano do
        select('usuarios.*, arrecadamentos.valor_pago as valor_pago').
        joins(:arrecadamentos, :arrecadacoes).
        where.not(arrecadamentos: {valor_pago: nil})#.
        #merge(Arrecadacao.por_mes_ano(mes_ano))
    end

    #delegate permite transferir métodos de um modelo para outro.
    #delegate :valor_pago, to: :arrecadamento, allow_nil:true


    validates_presence_of :nome, message: "deve ser preenchido"
    validates_uniqueness_of :nome, message: " - nome já cadastrado"
end