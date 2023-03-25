class Campaign < ApplicationRecord
  has_many :players

  def self.order_by_created_at
    order(created_at: :asc)
  end

  def num_of_players
    players.size
  end

  def order_players(param)
    players.order(param)
  end
end