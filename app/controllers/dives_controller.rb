class DivesController < ApplicationController
  def index
    # @dives = Dive.all
    @dives = Dive.true_beginners
  end

  def show
    @dive = Dive.find(params[:id])
  end

  def edit
    @dive = Dive.find(params[:id])
  end

  def update
    @dive = Dive.find(params[:id])
    if @dive.update(dive_params)
      @dive.save
      redirect_to "/dives/#{@dive.id}"
    else
      render 'edit'
    end
  end

  def destroy
    @dive = Dive.find(params[:id])
    @dive.destroy
    redirect_to '/dives'
  end

  private
    def dive_params
      params.permit(:title, :beginner, :max_depth,
                    :current_strength, :charter_loc)
    end
end
