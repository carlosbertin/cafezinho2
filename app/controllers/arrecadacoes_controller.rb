class ArrecadacoesController < ApplicationController
    include ArrecadacoesHelper

    def index
        @arrecadacoes = Arrecadacao.all
    end

    def destroy
        @arrecadacao = Arrecadacao.find(params[:id])
        @arrecadacao.destroy
        redirect_to action: "index"
    end

    def new 
        @arrecadacao = Arrecadacao.new
    end

    def create
        @arrecadacao = Arrecadacao.new(arrecadacao_params)
        if @arrecadacao.save
            redirect_to action: "index"
        else
            render 'new'
        end
    end

    def edit
        @arrecadacao = Arrecadacao.find(params[:id])
    end

    def update
        @arrecadacao = Arrecadacao.find(params[:id])
        if @arrecadacao.update_attributes arrecadacao_params
            redirect_to action: "index"
        else
            render 'edit'
        end
    end
    
    private
    def arrecadacao_params
        params.require(:arrecadacao).permit(:mes_ano, :valor_base)
    end

end
