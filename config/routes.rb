Rails.application.routes.draw do

  resources :yugioh_sets
  resources :cards
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  resources :users
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'sessions#new'
end
