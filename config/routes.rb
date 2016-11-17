Rails.application.routes.draw do

  get 'cards' => 'cards#index'
  get 'home' => 'home#index'
  root 'home#index'

end
