class Usuario < ApplicationRecord
    has_many :arrecadamentos
    has_many :arrecadacoes, through: :arrecadamentos

    # criar dois scopos: um para lista de usuários pendente pagamento e outra usuários que pagaram
    scope :usuario_pendente_pagamento, -> arrecadacao_id do
        select('usuarios.*').
        order('usuarios.nome').
        where.not(id: self.usuario_com_pagamento(arrecadacao_id).pluck(:id))
    end

    scope :usuario_com_pagamento, -> arrecadacao_id do
        select('usuarios.id, usuarios.cpf, usuarios.nome, arrecadamentos.valor_pago as valor_pago, arrecadamentos.id as arrecadamento_id ').
        joins("INNER JOIN arrecadamentos ON arrecadamentos.usuario_id = usuarios.id " +
              "INNER JOIN arrecadacoes ON arrecadacoes.id = arrecadamentos.arrecadacao_id").
        where("arrecadamentos.valor_pago > 0 and arrecadacoes.id = :arrec_id", arrec_id: arrecadacao_id).
        order('usuarios.nome')
    end

    validates_presence_of :nome, message: :nome_deve_ser_preenchido
    validates_uniqueness_of :nome, message: :nome_existente

    validates_presence_of :cpf, message: :cpf_deve_ser_preenchido
    validates_uniqueness_of :cpf, message: :cpf_existente
end