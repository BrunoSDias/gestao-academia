Rails.application.routes.draw do
  get 'treino_treinadors/index'
  resources :exercicios
  resources :enderecos
  resources :clientes
  resources :operadors, except: [:index]

  get '/treinador/login', to: 'login_treinador#signin'
  post '/treinador/login', to: 'login_treinador#access', as: :login_treinador

  scope :admin do
    get '/', to: 'administrador#index'
    resources :operadors
  end

  resources :treinadors, except: [:index, :show]
  scope :treinadors do
    get '/treinos', to: 'treino_treinadors#index'
    resources :treino_clientes, path: "/treino/clientes"
  end
  get '/treinadors', to: 'treinadors#show'

  resources :operadors, except: [:index, :show]
  scope :operadors do
    get '/treinos', to: 'treinos#index'
    resources :clientes
  end
  get '/operador', to: 'operadors#show'


  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
