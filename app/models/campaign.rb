class Campaign < ApplicationRecord
  has_many :players

  def self.order_by_created_at
    order(created_at: :asc)
  end
end