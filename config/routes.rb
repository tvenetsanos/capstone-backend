Rails.application.routes.draw do

  get '/dog/details', to: "sessions#get_dog"
  post '/dog/signup', to: "sessions#signup"
  post '/dog/signin', to: "sessions#signin"
  post '/dog/signout', to: "sessions#logout"
  post '/dog/login', to: "sessions#login"
  get '/dogs', to: "sessions#dogs"
  post '/messages', to: "messages#create"
  get '/messages', to: "messages#get_messages"
end