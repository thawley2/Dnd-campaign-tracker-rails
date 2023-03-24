class CampaignsController < ApplicationController
  def index
    @campaigns = Campaign.order_by_created_at
  end

  def show
    @campaign = Campaign.find(params[:id])
    @num_of_players = @campaign.num_of_players
  end

  def new
  end

  def create
    Campaign.create(
      campaign_name: params[:campaign_name],
      dm_name: params[:dm_name],
      first_dm: params[:first_dm],
      difficult_rating: params[:difficult_rating]
    )
    redirect_to '/campaigns'
  end
end