Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: %i[new create]
  get "up" => "rails/health#show", as: :rails_health_check
  root 'pages#index'
end
