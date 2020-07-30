Rails.application.routes.draw do

  resources :users, only: [:create, :index, :update]
  resources :meals
  post '/login', to: 'auth#create'


  get '/profile', to: 'users#profile'

end
