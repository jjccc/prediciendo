Prediciendo::Application.routes.draw do

  resources :authors
  
  resources :predictions
  
  match "information/what", as: "what", to: "information#show", via: [:get]

  root :to => 'predictions#index'
end
