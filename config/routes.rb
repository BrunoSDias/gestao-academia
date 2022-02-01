Rails.application.routes.draw do
  root to: "login/home#index"
  namespace :administrador do
    root to: 'home#index'

    resources :administradors
    resources :clientes do
      resources :enderecos
    end
    resources :operadors
    resources :treinadors
    get '/pagamentos', to: 'pagamentos#index'
  end

  namespace :login do
    root to: 'home#index'
    
    get '/administradors', to: 'administradors#signin'
    post '/administradors', to: 'administradors#access'

    get '/operadors', to: 'operadors#signin'
    post '/operadors', to: 'operadors#access'

    get '/treinadors', to: 'treinadors#signin'
    post '/treinadors', to: 'treinadors#access'
  end

  namespace :operador do
    root to: 'home#index'

    resources :clientes
    resources :exercicios
    resources :operadors, only: %i[show edit update]
    get '/pagamentos', to: 'pagamentos#index'
    resources :treinos
    resources :treinadors do
      resources :treino_treinadors
      resources :treino_clientes
    end
  end

  namespace :treinador do
    root to: 'home#index'

    resources :treinadors, only: %i[show]
    resources :treino_clientes, only: %i[index]
  end
end
