Rails.application.routes.draw do

  root to: "categories#index"
  get '/cart', to: 'carts#index'
  resource :cart, only: [:show, :create, :index, :destroy]

  resources :items, only: [:index]


  get "/:category_slug", to: 'categories#show', as: :category
  resources :categories, only: [:new, :index, :create]

  resources :users, only: [:new, :create, :show]
  namespace :admin do
    resources :users, only: [:index]
  end
  
  get    '/login',  to: 'sessions#new',     as: 'login'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
end
