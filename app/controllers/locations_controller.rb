require 'Date'

class LocationsController < ApplicationController
  def index
    #@locations = Locations.all
    @locations = ["Key West", "Asia", "Europe"]
  end

  def new

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
    task.save
    redirect_to '/locations'
  end
end
