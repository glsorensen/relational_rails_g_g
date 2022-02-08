class Player < ApplicationRecord
  belongs_to :team

  def self.healthy?
    where(healthy: true)
  end
end
