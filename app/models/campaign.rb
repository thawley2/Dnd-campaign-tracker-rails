class Campaign < ApplicationRecord
  has_many :players, dependent: :destroy

  def self.order_by_created_at
    order(created_at: :asc)
  end

  def num_of_players
    players.size
  end

  def retrieve_players(data)
    if !data[:order_by].nil?
      order_players(data)
    elsif !data[:level].nil?
      sort_players_by_lvl(data)
    else
      players
    end
  end

  def order_players(params)
    players.order(params[:order_by])
  end
  
  def sort_players_by_lvl(params)
    players.where('char_lvl > ?', params[:level])
  end
end