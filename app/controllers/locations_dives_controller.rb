class LocationsDivesController < ApplicationController
  def show
    if params[:az] == 'true'
      @location = Location.find(params[:id])
      @dives = @location.dives.alphabetical
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
      params.permit(:title, :beginner, :max_depth,
                    :current_strength, :charter_loc)
    end
end
