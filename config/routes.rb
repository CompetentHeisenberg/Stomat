Rails.application.routes.draw do
  resources :users, only: %i[new create]
  get "up" => "rails/health#show", as: :rails_health_check
  root 'pages#index'
end
