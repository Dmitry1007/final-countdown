Rails.application.routes.draw do
  root 'home#show'

  resources :users, only: [:new, :create]

  get    '/email', to: 'notifications#show'
  post   '/notifications', to: 'notifications#create'

  resources :links, only: [:index, :create, :edit, :update]

  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post "/links/:id", to: "links#update"
      get  "/index", to: "links#index"
    end
  end
end
