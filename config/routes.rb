Rails.application.routes.draw do
  get "/", to: "welcome#index"
  get '/locations', to: 'locations#index'
  get '/locations/new', to: 'locations#new'
  post '/locations', to: 'locations#create'
  get '/locations/:id', to: 'locations#show'
  get '/locations/:id/dives', to: 'locations#show_dives' ## PROBABLY WRONG ROUTE
  get '/dive', to: 'dives#index'
  get '/dive/:id', to: 'dives#show'
  get '/teams', to: 'teams#index'
  get '/teams/:id', to: 'teams#show'
end
