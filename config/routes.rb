Rails.application.routes.draw do

  root to: "categories#index"

  resources :categories, only: [:new, :index, :create, :show]
  resources :packages, only: [:create]
  resources :carts


  # get    '/login',  to: 'sessions#new',     as: 'login'
  # post   '/login',  to: 'sessions#create'
  # delete '/logout', to: 'sessions#destroy', as: 'logout'
end
