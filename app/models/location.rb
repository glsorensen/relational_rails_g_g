class Location < ApplicationRecord
  has_many :dives, dependent: :destroy 

  def self.created_by_order
    Location.order(created_at: :desc)
  end
end
