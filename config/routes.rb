Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: %i[new create destroy index]
  resources :passwords, only: [:edit, :update]
  resources :appointments, only: [:new, :create]
  resources :reviews, only:[:new, :create, :edit, :update, :destroy, :index]
  resources :users do
    get 'treatment_history', on: :member
  end
  get '/logout', to: 'sessions#destroy', as: 'logout'
  get '/history', to: 'userinfo#history', as: 'history'
  get '/appoint', to: 'userinfo#appoint', as: 'appoint'
  get "admininfo/:id", to: "admininfo#show", as: 'admininfo'
  get '/adminprofile', to: 'admininfo#adminprofile', as: 'adminprofile'
  get '/deleteclient', to: 'admininfo#deleteclient', as: 'deleteclient'
  get '/createdoctor', to: 'admininfo#createdoctor', as: 'createdoctor'
  get '/yourprofile', to: 'userinfo#yourprofile', as: 'yourprofile'
  get "/userinfo/:id", to: "userinfo#show", as: :userinfo
  get "up" => "rails/health#show", as: :rails_health_check
  get "/sessions" => "sessions#new"
  get "/sessions" => "sessions#create"
  get "/sessions" => "sessions#destroy"
  root 'pages#index'
end
