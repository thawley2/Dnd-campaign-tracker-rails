class Player < ApplicationRecord
  belongs_to :campaign

  def player_campaign
    campaign.campaign_name
  end

  def self.new_player_true
    Player.where(new_player: true)
  end
end