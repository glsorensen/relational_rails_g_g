require 'rails_helper'
RSpec.describe "Player Show page" do
  before (:each) do
    @team_1 = Team.create!(in_playoffs: true, total_wins: 43, name: "Avalanche", city: "Colorado", home_arena: "Ball Arena")
    @player_1 = @team_1.players.create!(healthy: true, weight_lbs: 210, name: "Timmy T", hometown: "Burnaby, BC")
  end

  it "has a link to update the player" do
    # player_2 = Player.create!(healthy: true, weight_lbs: 230, name: "Rob Blake", hometown: "Edmonton, AB" , team_id: team_1.id)

    visit "players/"

    expect(current_path).to eq("/players/")
    click_link(("Update: #{@player_1.name}") , match: :first)
    expect(current_path).to eq("/players/#{@player_1.id}/edit")
    click_on "Update Player"
    expect(current_path).to eq("/players/#{@player_1.id}")
  end
end
