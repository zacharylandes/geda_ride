Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create', as:"signin"
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  root to: "home#show"
  get '/home', to: "home#show"
  get '/homes', to: "home#index"

  resource :home, only: [:show]
  resources :destinations, only: [:index, :show]
  resources :origins, only: [:index]
  resources :rides
  resources :users
  resources :events
  resources :requests, only: [:create]
  resources :conversations do
    resources :messages
   end
 resources :charges

end
