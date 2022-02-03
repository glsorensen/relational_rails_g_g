class LocationsController < ApplicationController
  def index
    @locations = Locations.all
  end

  def show
    @location = Locations.find(params[:id])
  end

  def new

  end

  def create
    location = Locations.new({
      title: params[:location][:title],
      created_at: params[:location][:created_at],
      updated_at: params[:location][:updated_at],
      has_reefs: params[:location][:has_reefs],
      num_of_species: params[:location][:num_of_species],
      peak_season: params[:location][:peak_season],
      region: params[:location][:region],
      water_temp: params[:location][:water_temp]
      })
    task.save
    redirect_to '/locations'
  end
end
