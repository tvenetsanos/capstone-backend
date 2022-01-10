Rails.application.routes.draw do
  # User Routes
  get '/user', to: "users#get_user"
  put '/user/update', to: "users#update"
  delete '/user', to: "users#delete"
  get '/users', to: "users#users"

  # Dog Routes
  post '/dog', to: "dogs#add_dog"
  get '/dog', to: "dogs#get_dog"
  put '/dog/update', to: "dogs#update"

  # Conversation Routes
  get '/conversations', to: "conversations#get_conversations"
  get '/conversation/:id', to: "conversations#get_conversation"
  post '/conversation', to: "conversations#get_or_create"
  delete '/conversation/:conversation_id', to: "conversations#delete"

  # Message Routes
  post '/message', to: "messages#create"

  # Session Routes
  post '/signup', to: "sessions#signup"
  post '/login', to: "sessions#login"
  post '/logout', to: "sessions#logout"
  get '/session', to: "sessions#check_session"
end