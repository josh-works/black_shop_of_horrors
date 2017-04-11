Rails.application.routes.draw do

  root to: "categories#index"
  resources :items, only: [:index]
  resources :categories, only: [:new, :index, :create]
  resources :packages, only: [:create]
  resources :carts

  get "/:category_slug", to: 'categories#show', as: :category
  # get    '/login',  to: 'sessions#new',     as: 'login'
  # post   '/login',  to: 'sessions#create'
  # delete '/logout', to: 'sessions#destroy', as: 'logout'
end
