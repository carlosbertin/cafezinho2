class ArrecadamentosController < ApplicationController
    before_action :set_arrecadacao, only: :new

    def destroy
        @arrecadamento = Arrecadamento.find(params[:id])
        @arrecadamento.destroy
        redirect_to :controller => 'arrecadacoes', :action => 'index'
    end

    def new 
        @usuario = Usuario.find(params[:usuario_id])
        @arrecadamento = @arrecadacao.arrecadamentos.build(usuario_id: params[:usuario_id])
    end

    def create
        @arrecadamento = Arrecadamento.new(arrecadamento_params)
        if @arrecadamento.save
            redirect_to arrecadacao_usuarios_path(@arrecadamento.arrecadacao.id)
        else
            render 'new'
        end
    end

    def edit
        @arrecadamento = Arrecadamento.find(params[:id])
        @usuario = Usuario.find(@arrecadamento.usuario_id)
    end

    def update
        @arrecadamento = Arrecadamento.find(params[:id])
        if @arrecadamento.update_attributes arrecadamento_params
            redirect_to :controller => 'arrecadacoes', :action => 'index'
        else
            render 'edit'
        end
    end

    private

    def set_arrecadacao
        @arrecadacao = Arrecadacao.find(params[:arrecadacao_id])
    end

    def arrecadamento_params
        params[:valor_pago] = params[:valor_pago].to_f
        params.require(:arrecadamento).permit(:valor_pago, :usuario_id, :arrecadacao_id)
    end

end