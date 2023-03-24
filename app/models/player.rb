class Player < ApplicationRecord
  belongs_to :campaign

  def player_campaign
    campaign.campaign_name
  end
end