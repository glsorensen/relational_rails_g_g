class Team < ApplicationRecord

  has_many :players, dependent: :destroy
  validates_presence_of :name

  def self.order_by_created_first
    Team.order(:created_at)
  end

  def sort_a_z
    players.order(:name)
  end
end
