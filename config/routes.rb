Rails.application.routes.draw do

  root to: 'visitors#index'

  resources :businesses
  get 'visitors/index'





  
end
