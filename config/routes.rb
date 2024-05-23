Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: %i[new create destroy index]
  resources :passwords, only: [:edit, :update]
  resources :updateroles, only: [:update, :edit]
  resources :profiles, only: [:edit, :update]
  resources :appointments, only: [:new, :create]
  resources :reviews, only:[:new, :create, :edit, :update, :destroy, :index]
  resources :users do
    get 'treatment_history', on: :member
  end
  get '/logout', to: 'sessions#destroy', as: 'logout'
  get '/history', to: 'userinfo#history', as: 'history'
  get '/appoint', to: 'userinfo#appoint', as: 'appoint'
  get '/updatename', to: 'userinfo#updatename', as: 'updatename'
  get "admininfo/:id", to: "admininfo#show", as: 'admininfo'
  get '/adminprofile', to: 'admininfo#adminprofile', as: 'adminprofile'
  get '/deleteclient', to: 'admininfo#deleteclient', as: 'deleteclient'
  get '/createdoctor', to: 'admininfo#createdoctor', as: 'createdoctor'
  get "doctorinfo/:id", to: "doctorinfo#show", as: 'doctorinfo'
  get '/doctorprofile', to: 'doctorinfo#doctorprofile', as: 'doctorprofile'
  get '/doctorapointments', to: 'doctorinfo#doctorapointments', as: 'doctorapointments'
  get '/historyofclient', to: 'doctorinfo#historyofclient', as: 'historyofclient'
  get '/updatenamedoctor', to: 'doctorinfo#updatenamedoctor', as: 'updatenamedoctor'
  post '/create_doctor', to: 'users#create_doctor', as: 'create_doctor'
  patch '/create_doctor', to: 'users#create_doctor'
  get '/updatenameadmin', to: 'admininfo#updatenameadmin', as: 'updatenameadmin'
  get '/yourprofile', to: 'userinfo#yourprofile', as: 'yourprofile'
  get "/userinfo/:id", to: "userinfo#show", as: :userinfo
  get "up" => "rails/health#show", as: :rails_health_check
  get "/sessions" => "sessions#new"
  get "/sessions" => "sessions#create"
  get "/sessions" => "sessions#destroy"
  patch '/confirmed/:id', to: 'treatmentconfirm#confirm', as: 'confirm_treatment'
  patch '/reject/:id', to: 'treatmentconfirm#reject', as: 'reject_treatment'
  root 'pages#index'
end
