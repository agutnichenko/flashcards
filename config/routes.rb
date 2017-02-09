Rails.application.routes.draw do
  get 'oauths/oauth'
  get 'oauths/callback'

  resources :users
  root 'home#index'
  post 'trainers/:id/review', to: 'trainers#review', as: 'trainer'
  resources :cards
  resources :home
  resources :sessions
  resources :registrations, only: [:new, :create]

  root :to => 'users#index'
  root :to => 'registrations#index'
  #resources :SessionsController

  get 'login' => 'sessions#new', :as => :login
  delete 'logout' => 'sessions#destroy'

  post "oauth/callback" => "oauths#callback"
  get "oauth/callback" => "oauths#callback" # for use with Github, Facebook
  get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider
end
