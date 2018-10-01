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
        debugger
        arrecadacao = Arrecadacao.find(params[:arrecadacao_id])
        @usuario = Usuario.find(params[:usuario_id])
        # @arrecadamento = Arrecadamento.new
        @arrecadamento = arrecadacao.arrecadamentos.build(usuario_id: params[:usuario_id])
        #debugger
    end

    def create
        debugger
        @arrecadamento = Arrecadamento.new(arrecadamento_params)
        if @arrecadamento.save
            #debugger
            redirect_to arrecadacao_usuarios_path(@arrecadamento.arrecadacao.id)
        else
            debugger
            render 'new'
        end
    end

    def edit
        debugger
        @arrecadamento = Arrecadamento.find_by(arrecadacao_id: params[:arrecadacao_id], usuario_id: params[:usuario_id])
    end

    def update
        @arrecadamento = Arrecadamento.find_by(arrecadacao_id: params[:arrecadacao_id],usuario_id: params[:usuario_id])
        if @arrecadamento.update_attributes arrecadamento_params
            redirect_to :controller => 'arrecadacoes', :action => 'index'
        else
            render 'edit'
        end
    end

    private
    def arrecadamento_params
        params[:valor_pago] = params[:valor_pago].to_f
        params.require(:arrecadamento).permit(:valor_pago, :usuario_id, :arrecadacao_id)
    end
end