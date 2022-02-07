class Dive < ApplicationRecord
  belongs_to :location
  
  def self.alphabetical
    order(:title)
  end

  def self.true_beginners
    where(beginner: :true)
  end
end
