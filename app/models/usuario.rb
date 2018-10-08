class Usuario < ApplicationRecord
    has_many :arrecadamentos
    has_many :arrecadacoes, through: :arrecadamentos

    # criar dois scopos: um para lista de usuários pendente pagamento e outra usuários que pagaram
    scope :usuario_pendente_pagamento, -> arrecadacao_id do
        #debugger
        select('usuarios.*').
        order('usuarios.nome').
        where.not(id: self.usuario_com_pagamento(arrecadacao_id).pluck(:id))
    end

    scope :usuario_com_pagamento, -> arrecadacao_id do
        select('usuarios.*, arrecadamentos.valor_pago as valor_pago, arrecadamentos.id as arrecadamento_id ').
        joins(:arrecadamentos, :arrecadacoes).
        where("arrecadamentos.valor_pago > 0 and arrecadacoes.id = :arrec_id", arrec_id: arrecadacao_id).
        order('usuarios.nome')
        #merge(Arrecadacao.por_mes_ano(mes_ano))
    end

    validates_presence_of :nome, message: "deve ser preenchido"
    validates_uniqueness_of :nome, message: " - nome já cadastrado"
end