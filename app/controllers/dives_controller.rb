class DivesController < ApplicationController
  def index
    @dives = Dive.all
  end

  def show
    @dive = Dive.find(params[:id])
  end
end
