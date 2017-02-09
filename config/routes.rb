Rails.application.routes.draw do
  get 'oauths/oauth'
  get 'oauths/callback'

  resources :users
  root 'home#index'
  post 'trainers/:id/review', to: 'trainers#review', as: 'trainer'
  resources :cards
  #resources :home
  #resources :sessions, only: [:create]
  post 'login' => 'sessions#create'
  resources :registrations, only: [:new, :create]

  root :to => 'users#index'
  root :to => 'registrations#index'

  get 'login' => 'sessions#new', :as => :login
  delete 'logout' => 'sessions#destroy'

  post "oauth/callback" => "oauths#callback"
  get "oauth/callback" => "oauths#callback" # for use with Github, Facebook
  get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider
end
