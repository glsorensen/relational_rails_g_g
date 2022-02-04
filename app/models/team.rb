class Team < ApplicationRecord

  def self.order_by_created_first
    Team.order(created_at: :desc)
  end
end
