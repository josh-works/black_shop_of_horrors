Rails.application.routes.draw do

  root to: "categories#index"

  resources :items, only: [:index]


  get "/:category_slug", to: 'categories#show', as: :category
  resources :categories, only: [:new, :index, :create]

  get '/cart', to: 'carts#index'
  resource :cart, only: [:show, :create, :index, :destroy]

  # get    '/login',  to: 'sessions#new',     as: 'login'
  # post   '/login',  to: 'sessions#create'
  # delete '/logout', to: 'sessions#destroy', as: 'logout'
end
