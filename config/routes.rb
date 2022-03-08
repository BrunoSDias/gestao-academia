Rails.application.routes.draw do
  namespace :operador do
    get 'exercicio_treino_clientes/index'
    get 'exercicio_treino_clientes/altera_ordem'
  end
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

    post '/pagar', to: 'home#pagar'
    resources :clientes do
      resources :enderecos
      resources :treino_clientes do
        resources :exercicio_treino_clientes, only: %i[ index ]
        patch '/exercicio_treino_clientes/:id/altera_ordem', to: "exercicio_treino_clientes#altera_ordem"
      end
    end
    resources :exercicios
    resources :operadors, only: %i[show edit update]
    get '/pagamentos', to: 'pagamentos#index'
    resources :treinos
    resources :treinadors do
      resources :treino_treinadors
    end
  end

  namespace :treinador do
    root to: 'home#index'

    resources :treinadors, only: %i[show]
    resources :clientes do
      resources :treino_clientes, only: %i[index] do
        resources :andamento_exercicios, only: %i[index]
      end
    end
  end
end
