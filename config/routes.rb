Rails.application.routes.draw do

  get 'cards' => 'cards#cards'
  get 'home' => 'home#index'
  root 'home#index'

end
