class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def show 
    @player = Player.find(params[:id])
    @player_campaign = @player.campaign.campaign_name
  end
end