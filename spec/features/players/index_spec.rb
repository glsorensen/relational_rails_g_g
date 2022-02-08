require 'rails_helper'


 RSpec.describe 'dives index page' do
 	before(:each) do
    @team_2 = Team.create!(in_playoffs: false, total_wins: 27, name: "Red Wings", city: "Detroit", home_arena: "Little Ceasers Arena")
    @player_1 = @team_2.players.create!(healthy: true, weight_lbs: 220, name: "Nick Lidstrom", hometown: "Stockholm, SWE")
    @player_2 = @team_2.players.create!(healthy: true, weight_lbs: 180, name: "Chris Osgood", hometown: "Davos, CH" )
    @player_3 = @team_2.players.create!(healthy: false, weight_lbs: 196, name: "Steve Yzerman", hometown: "Cranbrook, CAN")

 	end

 	it 'only shows true records' do
 		visit '/players'
    expect(current_path).to eq("/players")
      expect(page).to have_content(@player_1.name)
      expect(page).to have_content(@player_1.healthy)
      expect(page).to have_content(@player_1.weight_lbs)
      expect(page).to have_content(@player_2.name)
      expect(page).to have_content(@player_2.healthy)
      expect(page).to have_content(@player_2.weight_lbs)
      expect(page).to_not have_content(@player_3.name)
      expect(page).to_not have_content(@player_3.hometown)
 	end


 end
