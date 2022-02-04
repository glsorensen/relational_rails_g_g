class LocationsDivesController < ApplicationController
  def show
    @location = Location.find(params[:id])
    @dives = Location.find(params[:id]).dives
  end
end
