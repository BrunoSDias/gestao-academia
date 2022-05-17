Rails.application.routes.draw do
  root to: "login/home#index"
  namespace :administrador do
    root to: 'home#index'

    post '/pagar', to: 'home#pagar'
    resources :clientes do
      resources :enderecos
    end
    resources :exercicios
    resources :operadors
    resources :treinos
    resources :treinadors
  end

  namespace :login do
    root to: 'home#index'
    get '/signout', to: "application#signout"
    
    get '/administradors', to: 'administradors#signin'
    post '/administradors', to: 'administradors#access'

    get '/operadors', to: 'operadors#signin'
    post '/operadors', to: 'operadors#access'

    get '/treinadors', to: 'treinadors#signin'
    post '/treinadors', to: 'treinadors#access'

    post '/clientes', to: 'clientes#access'
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
    resources :historicos, only: %i[ index show]

    resources :treinadors, only: %i[show]
    resources :clientes do
      resources :treino_clientes, only: %i[index] do
        resources :andamento_exercicios, only: %i[index] do
          patch '/update_status', to: 'andamento_exercicios#update_status'
        end
      end
    end
  end

  namespace :cliente do
    get '/show_cliente', to: 'clientes#show'
    get '/show_historico', to: 'historicos#show'
    get '/historicos/filter', to: 'historicos#filter'
    resources :clientes, except: :show
    resources :treino_clientes, only: [:index]
    patch '/andamento_exercicios/update_status', to: 'andamento_exercicios#update_status'
  end
end
