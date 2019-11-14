Rails.application.routes.draw do
  resources :sessions
  resources :users
  root 'staticpages#home'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  delete '/logout', to:'sessions#destroy' 
  resources :sessions
  resources :users
  resources :relationships,only:[:create,:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
