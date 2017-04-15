Rails.application.routes.draw do
  root to: "sessions#index"

  get '/cart', to: 'carts#show'
  resource :cart, only: [:create, :index, :destroy]
  resources :items, :categories, only: [:index]
  resources :users, only: [:create, :show]

  namespace :admin do
    resources :users, only: [:index]
    resources :items, :categories, only: [:create, :update, :destroy]
    get '/create-category',  to: 'categories#new',   as: 'create_category'
    get '/create-item',      to: 'items#new',        as: 'create_item'
  end

  resources :orders, only: [:create, :show, :index]
  resources :payments, only: [:create, :index]

  get    '/signup',         to: 'users#new',        as: 'signup'
  get    '/login',          to: 'sessions#new',     as: 'login'
  post   '/login',          to: 'sessions#create'
  delete '/logout',         to: 'sessions#destroy', as: 'logout'
  get    '/dashboard',      to: 'sessions#show',    as: 'dashboard'
  get    '/:category_slug', to: 'categories#show',  as: :category

end
