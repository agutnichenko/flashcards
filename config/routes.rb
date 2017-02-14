Rails.application.routes.draw do
  get 'oauths/oauth'
  get 'oauths/callback'

<<<<<<< HEAD
  resources :user, only: [:edit, :update, :show]
  #root 'home#index'
=======
  resource :users, only: [:edit, :update, :show]
  root 'home#index'
>>>>>>> f6a0d57491fb36289153f885b646a38ae42c17ba
  post 'trainers/:id/review', to: 'trainers#review', as: 'trainer'
  resources :cards
  #resources :home
  resources :sessions, only: [:create]
  #post 'login' => 'sessions#create'
  resources :registrations, only: [:new, :create]

  #root :to => 'users#index'
  root :to => 'registrations#index'

  get 'login' => 'sessions#new', :as => :login
  delete 'logout' => 'sessions#destroy'

  post "oauth/callback" => "oauths#callback"
  get "oauth/callback" => "oauths#callback" # for use with Github, Facebook
  get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider
end
