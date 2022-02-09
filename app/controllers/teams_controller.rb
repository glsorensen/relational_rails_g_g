class TeamsController < ApplicationController
  def index
    @teams = Team.order_by_created_first
  end

  def show
    @team = Team.find(params[:id])
    @players = Player.where(team_id: @team.id).count
  end

  def new
    @team = Team.new
  end

  def edit
    @team = Team.find(params[:id])
  end

  def destroy
    team = Team.find(params[:id])
    team.destroy

    redirect_to "/teams"

  end

  def create
    team = Team.new({
      in_playoffs: params[:team][:in_playoffs],
      total_wins: params[:team][:total_wins],
      name: params[:team][:name],
      city: params[:team][:city],
      home_arena: params[:team][:home_arena]
      })
    team.save
    redirect_to '/teams'
  end

  def update
    team = Team.find(params[:id])
    team.update(team_params)

    redirect_to "/teams/#{team.id}"
  end

  private
  def team_params
    params.permit(:name, :in_playoffs, :total_wins, :city, :home_arena)
  end
end
