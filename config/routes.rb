Rails.application.routes.draw do

  #get 'trainers/index'

  # get 'new' => 'cards#new'
  # get 'delete' => 'cards#destroy'
  # get 'edit' => 'cards#edit'
  # get 'cards' => 'cards#index'
  # get 'home' => 'home#index'
  root 'home#index'
  get 'trainers/review:id', to: 'trainers#review'
  resources :cards
  resources :home
end
