class Arrecadacoes::UsuariosController < ApplicationController
    before_action :set_arrecadacao

    def index
        @usuarios = Usuario.all
    end

    private

    def set_arrecadacao
        @arrecadacao = Arrecadacao.find(params[:arrecadacao_id])
    end
    
end
