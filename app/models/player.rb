class Player < ApplicationRecord
  belongs_to :team
  validates_presence_of :name, :weight_lbs

  def self.healthy?
    where(healthy: true)
  end

  def self.above_weight(weight)
    where("weight_lbs > #{weight}")
  end
end
