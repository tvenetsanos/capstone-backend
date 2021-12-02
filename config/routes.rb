Rails.application.routes.draw do

  get '/dog/details', to: "sessions#get_session"
end