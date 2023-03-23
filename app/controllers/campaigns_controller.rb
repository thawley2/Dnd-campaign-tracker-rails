class CampaignsController < ApplicationController
  def index
    @campaigns = Campaign.order_by_created_at
  end

  def show
    @campaign = Campaign.find(params[:id])
    @num_of_players = @campaign.num_of_players
  end
end