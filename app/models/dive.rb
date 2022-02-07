class Dive < ApplicationRecord
  belongs_to :location

  def self.alphabetical
    order(:title)
  end
end
