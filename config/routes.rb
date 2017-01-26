Rails.application.routes.draw do
  get 'registration/new'

  get 'registration/create'

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  resources :users
  root 'home#index'
  post 'trainers/:id/review', to: 'trainers#review', as: 'trainer'
  resources :cards
  resources :home

  root :to => 'users#index'
  root :to => 'registration#index'
  #resources :SessionsController

  get 'login' => 'sessions#new', :as => :login
  post 'logout' => 'sessions#destroy', :as => :logout
end
