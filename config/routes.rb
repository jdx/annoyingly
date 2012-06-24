Annoyingly::Application.routes.draw do

  resources :tickets

  resource :user, only: [ :new, :create ]
  resource :user_session, only: [ :new, :create, :destroy ]
  resources :emails, only: [ :create ]

  get 'login' => 'user_sessions#new'
  get 'logout' => 'user_sessions#destroy'
  get 'register' => 'users#new'

  root to: 'tickets#index'
end
