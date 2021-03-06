class LocationsDivesController < ApplicationController
  def show
    @location = Location.find(params[:id])
    if params[:az] == 'true'
      @dives = @location.dives.alphabetical
    elsif !params[:search].nil?
      @dives = @location.dives.depth_greater_than(params[:search])
    else
      @location = Location.find(params[:id])
      @dives = @location.dives
    end
  end

  def new
    @location = Location.find(params[:id])
  end

  def create
    @location = Location.find(params[:id])
    @dive = @location.dives.create!(dive_params)
    if @dive.save
      redirect_to "/locations/#{@location.id}/dives"
    else
      redirect_to "/locations/#{@location.id}/dives/new"
    end
  end

  private
    def dive_params
      params.permit(:title, :beginner, :max_depth, :current_strength, :charter_loc, :search)
    end
end
