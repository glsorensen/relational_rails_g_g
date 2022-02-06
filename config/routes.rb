Rails.application.routes.draw do
  get "/", to: "welcome#index"
  get '/locations', to: 'locations#index'
  get '/locations/new', to: 'locations#new'
  post '/locations', to: 'locations#create'
  get '/locations/:id', to: 'locations#show'
  get '/locations/:id/dives', to: 'locations_dives#show'
  get '/dive', to: 'dives#index'
  get '/dive/:id', to: 'dives#show'
  post '/teams', to: 'teams#create'
  get '/teams/new', to: 'teams#new'
  post '/teams/new', to: 'teams#create'
  get '/teams', to: 'teams#index'
  get '/teams/:id', to: 'teams#show'
  get '/players/:id', to: 'players#show'
  get '/players', to: 'players#index'
  get '/teams/:id/players', to: 'teams_players#index'
end

## AS WE BUILD PAGES - ADD TESTS FOR LINKS TO BOTH CHILD INDEXES
## AS WE BUILD PAGES - ADD LINKS FOR TO BOTH PARENT INDEXES
