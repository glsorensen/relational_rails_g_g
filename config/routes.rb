Rails.application.routes.draw do
  get "/", to: "welcome#index"

  get '/locations', to: 'locations#index'
  get '/locations/new', to: 'locations#new'
  post '/locations', to: 'locations#create'
  get '/locations/:id', to: 'locations#show'
  get '/locations/:id/edit', to: 'locations#edit'
  patch '/locations/:id', to: 'locations#update'


  get '/locations/:id/dives', to: 'locations_dives#show'
  get "/locations/:id/dives/new", to: 'locations_dives#new'
  post '/locations/:id/dives', to: 'locations_dives#create'

  get '/dive', to: 'dives#index'
  get '/dive/:id', to: 'dives#show'


  get '/dive/:id/edit', to: 'dives#edit'
  patch '/dive/:id', to: 'dives#update'


  get '/teams', to: 'teams#index'
  post '/teams', to: 'teams#create'
  delete '/teams', to: 'teams#destroy'
  get '/teams/new', to: 'teams#new'
  get '/teams/:id/edit', to: 'teams#edit'
  get '/teams/:id', to: 'teams#show'
  patch '/teams/:id', to: 'teams#update'
  delete '/teams/:id', to: 'teams#destroy'
  post '/teams/new', to: 'teams#create'



  patch '/players/:id', to: 'players#update'
  delete '/players/:id', to: 'players#destroy'
  get '/players', to: 'players#index'
  get '/players/:id', to: 'players#show'
  get '/players/:id/edit', to: 'players#edit'
  post '/players/:id', to: 'players#update'
  get '/teams/:id/players', to: 'teams_players#index'
  get '/teams/:id/players/new', to: 'teams_players#new'
  post 'teams/:id/players', to: 'teams_players#create'
end

## AS WE BUILD PAGES - ADD TESTS FOR LINKS TO BOTH CHILD INDEXES
## AS WE BUILD PAGES - ADD LINKS FOR TO BOTH PARENT INDEXES
