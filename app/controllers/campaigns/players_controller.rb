class Campaigns::PlayersController < ApplicationController
  def index
    @campaign = Campaign.find(params[:campaign_id])
    if params[:order_by].nil?
      @players = @campaign.players
    else
      @players = @campaign.players.order(params[:order_by])
    end
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