require 'rails_helper'

RSpec.describe "Destroy Team" do
  describe 'as a visitor' do
    describe 'when i visit the players show page and i see a link to delete' do
      it 'deletes the player' do
        team_1 = Team.create!(in_playoffs: true, total_wins: 43, name: "Avalanche", city: "Colorado", home_arena: "Ball Arena")
        player_1 = Player.create!(healthy: true, weight_lbs: 210, name: "Joe Sakic", hometown: "Burnaby, CAN", team_id: team_1.id)
        player_2 = Player.create!(healthy: true, weight_lbs: 230, name: "Rob Blake", hometown: "Edmonton, CAN" , team_id: team_1.id)
        player_3 = Player.create!(healthy: false, weight_lbs: 190, name: "Patrick Roy", hometown: "Quebeq City, CAN" , team_id: team_1.id)

        visit "/players/#{player_1.id}"
        save_and_open_page
        expect(current_path).to eq("/players/#{player_1.id}")
        expect(page).to have_content("Joe Sakic")
        expect(page).to have_link("Delete: #{player_1.name}")
        click_on "Delete: #{player_1.name}"
        expect(current_path).to eq("/players")
        expect(page).to_not have_content("Joe Sakic")

      end
    end
  end
end
