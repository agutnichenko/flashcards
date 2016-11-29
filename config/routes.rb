Rails.application.routes.draw do

  get 'new' => 'cards#new'
  get 'delete' => 'cards#destroy'
  get 'edit' => 'cards#edit'
  get 'cards' => 'cards#index'
  get 'home' => 'home#index'
  root 'home#index'
  resources :cards

end
