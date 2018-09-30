class UsuariosController < ApplicationController

    def index
        @usuarios = Usuario.all
    end

    def show
        @usuario = Usuario.find(params[:id])
    end

    def destroy
        @usuario = Usuario.find(params[:id])
        @usuario.destroy
        redirect_to action: "index"
    end

    def new 
        @usuario = Usuario.new
    end

    def create
        @usuario = Usuario.new(usuario_params)
        if @usuario.save
            redirect_to(action: "show", id: @usuario)
        else
            render 'new'
        end
    end

    def edit
        @usuario = Usuario.find(params[:id])
    end

    def update
        @usuario = Usuario.find(params[:id])
        if @usuario.update_attributes usuario_params
            redirect_to(action: "show", id: @usuario)
        else
            render 'edit'
        end
    end

    private
    def usuario_params
      params.require(:usuario).permit(:nome, :cpf, :data_desativacao)
    end

    
end
