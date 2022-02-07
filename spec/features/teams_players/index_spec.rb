require 'rails_helper'
RSpec.describe "Team and Player index" do
  it " Shows individual player associated with the team and its attributes" do
    team_1 = Team.create!(in_playoffs: true, total_wins: 43, name: "Avalanche", city: "Colorado", home_arena: "Ball Arena")
    player_1 = Player.create!(healthy: true, weight_lbs: 210, name: "Joe Sakic", hometown: "Burnaby, BC", team_id: team_1.id)
    player_2 = Player.create!(healthy: true, weight_lbs: 230, name: "Rob Blake", hometown: "Edmonton, AB" , team_id: team_1.id)

    visit "teams/#{team_1.id}/players"

    expect(current_path).to eq("/teams/#{team_1.id}/players")
    expect(page).to have_content(team_1.name)
    expect(page).to have_content(player_1.weight_lbs)
    expect(page).to have_content(player_1.name)
    expect(page).to have_content(player_1.hometown)
    expect(page).to have_content(player_1.healthy)
    expect(page).to have_content(player_2.weight_lbs)
    expect(page).to have_content(player_2.name)
    expect(page).to have_content(player_2.hometown)
    expect(page).to have_content(player_2.healthy)
  end
  it " allows user to create a new player for a team" do
    team_1 = Team.create!(in_playoffs: true, total_wins: 43, name: "Avalanche", city: "Colorado", home_arena: "Ball Arena")
    player_1 = Player.create!(healthy: true, weight_lbs: 210, name: "Joe Sakic", hometown: "Burnaby, BC", team_id: team_1.id)
    player_2 = Player.create!(healthy: true, weight_lbs: 230, name: "Rob Blake", hometown: "Edmonton, AB" , team_id: team_1.id)

    visit "teams/#{team_1.id}/players"

    expect(current_path).to eq("/teams/#{team_1.id}/players")
    click_link "Add New Player: #{team_1.name}"
    expect(current_path).to eq("/teams/#{team_1.id}/players/new")
    fill_in "Name", with: "GOldberg"
    find('#healthy').click
    fill_in("Weight lbs", with: 40)
    # fill_in :placeholder => 'Total Wins', with: '40', visible: false
    fill_in "Hometown", with: "Los Angeles"
    click_on "Create Player"
    expect(current_path).to eq("/teams/#{team_1.id}/players")
  end


end
