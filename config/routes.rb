Rails.application.routes.draw do
  root to: "categories#index"
  
  resources :categories, only: [:new, :index, :create]

end
