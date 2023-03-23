class CampaignsController < ApplicationController
  def index
    @campaigns = Campaign.order_by_created_at
  end

  def show
    @campaign = Campaign.find(params[:id])
  end
end