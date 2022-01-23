Rails.application.routes.draw do
  # User Routes
  get '/user', to: "users#show"
  post '/signup', to: "sessions#create"
  put '/user', to: "users#update"
  delete '/user', to: "users#destroy"
  get '/users', to: "users#index"

  # Dog Routes
  post '/dog', to: "dogs#create"
  put '/dog/:id', to: "dogs#update"

  # Conversation Routes
  get '/conversations', to: "conversations#index"
  get '/conversation/:id', to: "conversations#show"
  post '/conversation', to: "conversations#create"
  delete '/conversation/:id', to: "conversations#destroy"

  # Message Routes
  post '/message', to: "messages#create"

  # Session Routes
  post '/login', to: "sessions#login"
  post '/logout', to: "sessions#logout"
  get '/session', to: "sessions#check_session"
end