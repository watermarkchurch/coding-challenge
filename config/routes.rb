# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'pages#home'
  get '/new', to: 'messages#new'
  get '/edit', to: 'messages#edit'
  # get '/destroy', to: 'messages#destroy'

  resources :messages
end
