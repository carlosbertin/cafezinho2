class ArrecadamentosController < ApplicationController
    before_action :edit#, :destroy

    def destroy
        #@arrecadamento = Arrecadamento.find(params[:id])
        @arrecadamento = Arrecadamento.find_by(arrecadacao_id: params[:arrecadacao_id], usuario_id: params[:usuario_id])
        #debugger
        @arrecadamento.destroy
        redirect_to :controller => 'arrecadacoes', :action => 'index'
    end

    def new 
        arrecadacao = Arrecadacao.find(params[:arrecadacao_id])
        @arrecadamento = arrecadacao.arrecadamentos.build(usuario_id: params[:usuario_id])
        #debugger
    end

    def create
        @arrecadamento = Arrecadamento.new(Arrecadamento_params)
        if @arrecadamento.save
            redirect_to :controller => 'arrecadacoes', :action => 'index'
        else
            #debugger
            render 'new'
        end
    end

    def edit
        @arrecadamento = Arrecadamento.find_by(arrecadacao_id: params[:arrecadacao_id], usuario_id: params[:usuario_id])
    end

    def update
        @arrecadamento = Arrecadamento.find_by(arrecadacao_id: params[:arrecadacao_id],usuario_id: params[:usuario_id])
        if @arrecadamento.update_attributes Arrecadamento_params
            redirect_to :controller => 'arrecadacoes', :action => 'index'
        else
            render 'edit'
        end
    end

    private
    def Arrecadamento_params
        params[:valor_pago] = params[:valor_pago].to_f
        params.require(:arrecadamento).permit(:valor_pago, :usuario_id, :arrecadacao_id)
    end
end