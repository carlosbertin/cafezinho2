class ProdutosController < ApplicationController
    
    def index
        @produtos = Produto.all
    end

    def show
        @produto = Produto.find(params[:id])
    end

    def destroy
        @produto = Produto.find(params[:id])
        @produto.destroy
        redirect_to action: 'index'
    end

    def new
        @produto = Produto.new
    end

    def create
        @produto = Produto.new(produto_params)
        if @produto.save
            redirect_to(action: 'show', id: @produto)
        else
            render 'new'
        end
    end

    def edit
        @produto = Produto.find(params[:id])
    end

    def update
        @produto = Produto.find(params[:id])
        if @produto.update_attributes produto_params
            redirect_to(action: 'show', id: @produto)
        else
            render 'edit'
        end
    end

    private
    def produto_params
        params.require(:produto).permit(:nome, :unidade, :observacao)
    end

end
