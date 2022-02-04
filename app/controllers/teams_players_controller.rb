class TeamsPlayersController < ApplicationController
  def show
    # @player = Player.find(params[:id])
  end

  def index
    @team = Team.find(params[:id])
    @players = Player.where(team_id: @team.id)
  end
end
