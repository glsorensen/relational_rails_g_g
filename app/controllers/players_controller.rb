class PlayersController < ApplicationController
  def show
    @player = Player.find(params[:id])
  end

  def index
    @players = Player.all.healthy?
  end

  def edit
# binding.pry
    @player = Player.find(params[:id])

  end

  def destroy
    player = Player.find(params[:id])
    player.destroy

    redirect_to "/players"

  end

  def create
    player = Player.new({
      name: params[:player][:name],
      healthy: params[:player][:healthy],
      weight_lbs: params[:player][:weight_lbs],
      hometown: params[:player][:hometown],
      })
    player.save
    redirect_to '/players'
  end

  def update
    player = Player.find(params[:id])
    player.update(player_params)
    player.save
    redirect_to "/players/"
  end

  private
  def player_params
    params.permit(:name, :healthy, :weight_lbs, :hometown)
  end
end
