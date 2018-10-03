Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #o browser aceita este endereço: http://localhost:3000/bem_vindo/index
  root 'bem_vindo#index' 
  #esta linha mapeia as requisições do get 'bem_vindo/index' acima de
  #modo que permite que a página (/bem_vindo/index.html.erb) também seja
  #acessada pela raiz (root) do sistema: http://localhost:3000/

  resources :usuarios
  resources :produtos
  resources :arrecadacoes do
    resources :arrecadamentos, except: [:show, :index]
    resources :usuarios, only: :index, controller: 'arrecadacoes/usuarios'
  end
  
end