Rails.application.routes.draw do

  root to: "categories#index"

  resources :items, only: [:index]
  resources :categories, only: [:new, :index, :create, :show]
  get '/cart', to: 'carts#index'
  resources :carts


  # get    '/login',  to: 'sessions#new',     as: 'login'
  # post   '/login',  to: 'sessions#create'
  # delete '/logout', to: 'sessions#destroy', as: 'logout'
end
