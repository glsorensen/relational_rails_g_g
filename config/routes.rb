Rails.application.routes.draw do
  get "/", to: "welcome#index"
  get '/locations', to: 'locations#index'
  get '/locations/new', to: 'locations#new'
  post '/locations', to: 'locations#create'
  get '/teams', to: 'teams#index'
end
