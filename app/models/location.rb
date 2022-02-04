class Location < ApplicationRecord
  has_many :dives
  validates_presence_of :title
end
