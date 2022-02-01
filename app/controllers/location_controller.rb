class LocationController < ApplicationController
  def index
    @locations = Locations.all
  end
end 
