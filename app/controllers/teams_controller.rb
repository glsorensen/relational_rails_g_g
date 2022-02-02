class TeamsController < ApplicationController
  def index
    @teams = Teams.all
  end

  def new

  end

  def create
    team = Teams.new({
      title: params[:team][:title],
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
