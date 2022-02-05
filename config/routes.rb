Rails.application.routes.draw do
  get "/", to: "welcome#index"
  get '/locations', to: 'locations#index'
  get '/locations/new', to: 'locations#new'
  post '/locations', to: 'locations#create'
  get '/locations/:id', to: 'locations#show'
  get '/locations/:id/dives', to: 'locations_dives#show'
  get '/dive', to: 'dives#index'
  get '/dive/:id', to: 'dives#show'
  get '/teams', to: 'teams#index'
  get '/teams/:id', to: 'teams#show'
  get '/players/:id', to: 'players#show'
  get '/players', to: 'players#index'
  get '/teams/:id/players', to: 'teams_players#index'
end

## AS WE BUILD PAGES - ADD LINKS TO BOTH CHILD INDEXES
## AS WE BUILD PAGES - ADD LINKS TO BOTH PARENT INDEXES
