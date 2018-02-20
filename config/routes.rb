Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  root to: "home#show"
  get '/home', to: "home#show"
  resource :home, only: [:show]
  # get 'rides', to: 'ridesindex#bottom'
  resources :rides
  resources :users

end
