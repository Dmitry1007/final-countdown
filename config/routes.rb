Rails.application.routes.draw do
  root 'home#show'

  resources :users, only: [:new, :create]
end
