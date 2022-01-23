Rails.application.routes.draw do
  # User Routes
  get '/user', to: "users#show"
  post '/users', to: "users#create"
  put '/users', to: "users#update"
  delete '/users', to: "users#destroy"
  get '/users', to: "users#index"

  # Dog Routes
  post '/dogs', to: "dogs#create"
  put '/dogs/:id', to: "dogs#update"

  # Conversation Routes
  get '/conversations', to: "conversations#index"
  get '/conversations/:id', to: "conversations#show"
  post '/conversations', to: "conversations#create"
  delete '/conversations/:id', to: "conversations#destroy"

  # Message Routes
  post '/messages', to: "messages#create"

  # Session Routes
  post '/login', to: "sessions#login"
  post '/logout', to: "sessions#logout"
  get '/session', to: "sessions#check_session"
end