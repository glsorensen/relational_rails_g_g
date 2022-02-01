class LocationsController < ApplicationController
  def index
    #@locations = Locations.all
    @locations = ["Key West", "Asia", "Europe"]
  end
end
