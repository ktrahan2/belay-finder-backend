Rails.application.routes.draw do
  resources :favorite_routes
  resources :climbing_routes
  resources :partnerships
  resources :users
  post '/login', to: 'users#login'
  get '/profile', to: 'users#profile'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
