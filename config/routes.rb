Rails.application.routes.draw do

  root to: 'visitors#index'

  resources :businesses

  resources :settings do 
    post :off_toggle, on: :collection
    post :on_toggle,  on: :collection    
    get :yelp_categories,  on: :collection
  end

  post '/push', to: 'businesses#push_notifications'
  get '/safari', :to => redirect('/safari-error.html')
  
end
