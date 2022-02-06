class LocationsController < ApplicationController
  def index
    @locations = Location.created_by_order
  end

  def show
    @location = Location.find(params[:id])
    @dives = @location.dives.count
  end

  def new
    @location = Location.new
  end

  def create
    location = Location.new({
      title: params[:location][:title],
      created_at: params[:location][:created_at],
      updated_at: params[:location][:updated_at],
      has_reefs: params[:location][:has_reefs],
      num_of_species: params[:location][:num_of_species],
      peak_season: params[:location][:peak_season],
      region: params[:location][:region],
      water_temp: params[:location][:water_temp]
      })
    location.save
    redirect_to '/locations'
  end
end
