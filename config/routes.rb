Rails.application.routes.draw do

  root 'home#index'

  scope module: 'home' do
    get 'oauths/oauth'
    get 'oauths/callback'
    resources :sessions, only: [:new, :create]
    resources :registrations, only: [:new, :create]
    root to: 'registrations#index'
    get 'login', to: 'sessions#new', :as => :login
    post 'oauth/callback', to: 'oauths#callback'
    get 'oauth/callback', to: 'oauths#callback' # for use with Github, Facebook
    get 'oauth/:provider', to: 'oauths#oauth', :as => :auth_at_provider
  end

  scope module: 'dashboard' do
    resources :sessions, only: [:destroy]
    resource :user, only: [:edit, :update, :show]
    post 'trainers/:id/review', to: 'trainers#review', as: 'trainer'
    resources :cards
    resources :decks
    delete 'logout', to: 'sessions#destroy'
  end

  scope '(:locale)', locale: /en|ru/ do
    resources :login
    resources :registrations
  end

end
