class Campaigns::PlayersController < ApplicationController
  def index
    @campaign = Campaign.find(params[:campaign_id])
    @players = @campaign.players
  end
end