Rails.application.routes.draw do
  root 'staticpages#home'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  delete '/logout', to:'sessions#destroy' 
  resources :sessions
  resources :users
  resources :relationships,only:[:create,:destroy]
  namespace :admin do
    get'/home', to:'users#home'
    resources :users
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
