Rails.application.routes.draw do


  get 'home' => 'home#index'
  #get 'home/index'
  root 'home#index'
end
