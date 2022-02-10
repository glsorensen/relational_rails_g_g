class Dive < ApplicationRecord
  belongs_to :location

  def self.alphabetical
    order(:title)
  end

  def self.true_beginners
    where(beginner: :true)
  end

  def self.depth_greater_than(number)
    where("max_depth > ?", number.to_i)
  end
end
