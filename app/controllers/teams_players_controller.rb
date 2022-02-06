class TeamsPlayersController < ApplicationController
  def show
    # @player = Player.find(params[:id])
  end

  def index
    @team = Team.find(params[:id])
    @players = Player.where(team_id: @team.id)
  end

  def new
    @team = Team.find(params[:id])
  end

  def create
    team = Team.find(params[:id])
    team.players.create(players_param)

    redirect_to "/teams/#{team.id}/players"
  end

  private
  def players_param
   params.permit(:name, :healthy, :total_wins, :weight_lbs)
 end
end
