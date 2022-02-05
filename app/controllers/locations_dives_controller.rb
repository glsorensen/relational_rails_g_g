class LocationsDivesController < ApplicationController
  def show
    @location = Location.find(params[:id])
    @dives = @location.dives
  end
end
