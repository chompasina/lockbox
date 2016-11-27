Rails.application.routes.draw do
  root to: "links#index"
  
  resources :links, only: [:index, :new, :create]
  resources :users, only: [:new, :create]
  
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
