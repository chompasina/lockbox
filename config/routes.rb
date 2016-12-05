Rails.application.routes.draw do
  root to: "links#index"
  
  resources :links, only: [:index, :new, :create, :edit, :update, :show]
  resources :users, only: [:new, :create]
  resources :tags
  
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  
  namespace :api do
    namespace :v1 do
      resources :links, only: [:create, :index, :edit, :update]
      resources :link_tags, only: [:destroy]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
