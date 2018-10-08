class ComprasController < ApplicationController
    #before_action :set_compra, only: :new

    def index
        @compras = Compra.all
    end

    def destroy
        @compra = Compra.find(params[:id])
        @compra.destroy
        redirect_to arrecadacao_usuarios_path(@compra.arrecadacao.id)
    end

    def new 
        @usuario = Usuario.find(params[:usuario_id])
        @compra = @arrecadacao.arrecadamentos.build(usuario_id: params[:usuario_id])
    end

    def create
        @compra = Compra.new(compra_params)
        if @compra.save
            redirect_to arrecadacao_usuarios_path(@compra.arrecadacao.id)
        else
            @usuario = @compra.usuario
            render 'new'
        end
    end

    def edit
        @compra = Compra.find(params[:id])
        @usuario = Usuario.find(@compra.usuario_id)
    end

    def update
        @compra = Compra.find(params[:id])
        if @compra.update_attributes compra_params
            redirect_to arrecadacao_usuarios_path(@compra.arrecadacao.id)
        else
            @usuario = @compra.usuario
            render 'edit'
        end
    end

    private

    def set_compra
        @arrecadacao = Arrecadacao.find(params[:arrecadacao_id])
    end

    def compra_params
        params[:valor_pago] = params[:valor_pago].to_f
        params.require(:arrecadamento).permit(:valor_pago, :usuario_id, :arrecadacao_id)
    end

end