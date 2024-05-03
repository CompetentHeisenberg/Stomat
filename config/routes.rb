Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: %i[new create]
  get "up" => "rails/health#show", as: :rails_health_check
  get "/sessions" => "sessions#new"
  get "/sessions" => "sessions#create"
  get "/sessions" => "sessions#destroy"
  root 'pages#index'
end
