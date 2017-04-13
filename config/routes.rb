Rails.application.routes.draw do
  root to: "sessions#index"

  get '/cart', to: 'carts#index'
  resource :cart, only: [:show, :create, :index, :destroy]

  resources :items, only: [:index]


  resources :categories, only: [:new, :index, :create]

  get "/signup", to: "users#new", as: 'signup'
  resources :users, only: [:create, :show]

  namespace :admin do
    resources :users, only: [:index]
  end

  get    '/login',  to: 'sessions#new',     as: 'login'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  get    '/dashboard', to: 'sessions#show', as: 'dashboard'
  get    '/:category_slug', to: 'categories#show', as: :category

end
