class ComprasController < ApplicationController
    include ArrecadacoesHelper

    def index
        @compras = Compra.includes(:produto, :arrecadacao).order('arrecadacoes.id, produtos.nome').search(params[:search])
    end

    def destroy
        @compra = Compra.find(params[:id])
        @compra.destroy
        redirect_to compras_path
    end

    def show
        @compra = Compra.find(params[:id])
    end

    # def getbusca
    #     @compras = Compra.search(params[:search])
    # end

    def new
        @compra = Compra.new
    end

    def create
        @compra = Compra.new(compra_params)
        if @compra.save
            redirect_to(action: 'show', id: @compra)
        else
            render 'new'
        end
    end

    def edit
        #@compra = Compra.find(params[:id])
        @compra = Compra.includes(:produto, :arrecadacao).find(params[:id])
    end

    def update
        @compra = Compra.find(params[:id])
        if @compra.update_attributes compra_params
            redirect_to(action: 'show', id: @compra)
        else
            render 'edit'
        end
    end

    private

    def compra_params
        params.require(:compra).permit(:arrecadacao_id, :produto_id, :preco, :quantidade, :data_compra)
    end

end