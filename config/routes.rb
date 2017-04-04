Rails.application.routes.draw do
  get 'oauths/oauth'
  get 'oauths/callback'
  resource :user, only: [:edit, :update, :show]
  root 'home#index'
  post 'trainers/:id/review', to: 'trainers#review', as: 'trainer'
  resources :cards
  resources :decks
  resources :sessions, only: [:create]
  resources :registrations, only: [:new, :create]
  root to: 'registrations#index'
  get 'login', to: 'sessions#new', :as => :login
  delete 'logout', to: 'sessions#destroy'
  post 'oauth/callback', to: 'oauths#callback'
  get 'oauth/callback', to: 'oauths#callback' # for use with Github, Facebook
  get 'oauth/:provider', to: 'oauths#oauth', :as => :auth_at_provider
  scope '(:locale)', locale: /en|ru/ do
    resources :login
    resources :registrations
  end
end
