class Campaigns::PlayersController < ApplicationController
  def index
    player_data = {order_by: params[:order_by], level: params[:level]}
    @campaign = Campaign.find(params[:campaign_id])
    @players = @campaign.retrieve_players(player_data)
  end

  def new
    @campaign = Campaign.find(params[:campaign_id])
  end

  def create
    @campaign = Campaign.find(params[:campaign_id])
    @campaign.players.create(player_params)
    redirect_to "/campaigns/#{@campaign.id}/players"
  end

  private
  def player_params
    params.permit(:player_name, :character_name, :new_player, :char_lvl)
  end
end