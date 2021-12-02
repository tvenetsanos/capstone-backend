Rails.application.routes.draw do

  get '/dog/details', to: "sessions#get_session"
  post '/dog/signup', to: "sessions#signup"
  post '/dog/signin', to: "sessions#signin"
  post '/dog/signout', to: "sessions#logout"
end