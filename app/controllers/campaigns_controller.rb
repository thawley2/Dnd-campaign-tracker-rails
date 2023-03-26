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
    Campaign.create(campaign_params)
    redirect_to '/campaigns'
  end

  def edit
    @campaign = Campaign.find(params[:id])
  end

  def update
    campaign = Campaign.find(params[:id])
    campaign.update(campaign_params)
    redirect_to "/campaigns/#{campaign.id}"
  end

  def destroy
    campaign = Campaign.find(params[:id])
    campaign.players.destroy_all
    campaign.destroy
    redirect_to "/campaigns"
  end

  private
  def campaign_params
    params.permit(:campaign_name, :dm_name, :first_dm, :difficult_rating)
  end
end