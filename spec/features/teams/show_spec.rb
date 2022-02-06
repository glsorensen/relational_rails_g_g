require 'rails_helper'

RSpec.describe "Team show page", type: :feature do
    it "Count of players per team" do
      team_1 = Team.create!(in_playoffs: true, total_wins: 43, name: "Avalanche", city: "Colorado", home_arena: "Ball Arena")
      player_1 = Player.create!(healthy: true, weight_lbs: 210, name: "Joe Sakic", hometown: "Burnaby, CAN", team_id: team_1.id)
      player_2 = Player.create!(healthy: true, weight_lbs: 230, name: "Rob Blake", hometown: "Edmonton, CAN" , team_id: team_1.id)
      player_3 = Player.create!(healthy: false, weight_lbs: 190, name: "Patrick Roy", hometown: "Quebeq City, CAN" , team_id: team_1.id)

      visit "/teams/#{team_1.id}"
      expect(current_path).to eq("/teams/#{team_1.id}")

      expect(page).to have_content("Number of players = 3")
    end

end
