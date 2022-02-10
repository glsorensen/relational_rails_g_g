class AddTeamsToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_reference :players, :team, foreign_key: true
  end
end
