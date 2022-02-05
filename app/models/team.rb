class Team < ApplicationRecord

  has_many :players

  def self.order_by_created_first
    Team.order(:created_at)
  end
end
