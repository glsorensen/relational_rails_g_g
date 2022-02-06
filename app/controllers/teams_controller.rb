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

  def create
    team = Team.new({
      in_playoffs: params[:team][:in_playoffs],
      total_wins: params[:team][:total_wins],
      name: params[:team][:name],
      city: params[:team][:city],
      mascot: params[:team][:mascot]
      })
    task.save
    redirect_to '/teams'
  end
end
