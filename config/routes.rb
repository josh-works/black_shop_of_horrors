Rails.application.routes.draw do
  root to: "sessions#index"

  get '/cart', to: 'carts#show'
  resource :cart, only: [:create, :index, :destroy, :update]
  resources :users, only: [:create, :show, :update]
  resources :items, only: [:show, :index]
  resources :categories, only: [:index]

  # static pages
  get '/faq', to: 'pages#show', as: 'faq'


  namespace :admin do
    resources :users, only: [:index, :edit]
    resources :items, :categories, only: [:create, :update, :destroy]
    get '/create-category',  to: 'categories#new',   as: 'create_category'
    get '/create-item',      to: 'items#new',        as: 'create_item'
    get '/dashboard',        to: 'users#dashboard',  as: 'dashboard'
    get '/orders',           to: 'orders#all',       as: 'orders'
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
