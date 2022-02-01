Rails.application.routes.draw do
  get "/", to: "welcome#index"
  get "/locations", to: "locations#index"
end
