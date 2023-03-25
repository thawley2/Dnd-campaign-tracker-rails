class PlayersController < ApplicationController
  def index
    @players = Player.new_player_true
  end

  def show 
    @player = Player.find(params[:id])
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    player = Player.find(params[:id])
    player.update(player_params)
    redirect_to "/players/#{player.id}"
  end

  private
  def player_params
    params.permit(:player_name, :character_name, :new_player, :char_lvl)
  end
end