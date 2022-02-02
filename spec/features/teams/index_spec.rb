require 'rails_helper'

RSpec.describe "Teams index page", type: :feature do
# For each teams table
# As a visitor
# When I visit '/teams'
# Then I see the name of each teams record in the system
  it "can see all teams by name" do
    team_1 = Teams.create(name: "Avalanche")
    team_2 = Teams.create(name: "Red Wings")
    team_3 = Teams.create(name: "Lightning")

    visit "/teams"

    expect(current_path).to eq('/teams')
    expect(page).to have_content(team_1.name)
    expect(page).to have_content(team_2.name)
    expect(page).to have_content(team_3.name)
  end
# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes:
# - data from each column that is on the parent table
  it "finds team by :id and shows teams attributes" do
    team_1 = Teams.create(in_playoffs: true, total_wins: 43, name: "Avalanche", city: "Colorado", home_arena: "Ball Arena")

    visit "/teams/#{team_1.id}"

    save_and_open_page
    expect(current_path).to eq("/teams/#{team_1.id}")
    expect(page).to have_content(team_1.total_wins)
    expect(page).to have_content(team_1.name)
    expect(page).to have_content(team_1.city)
    expect(page).to have_content(team_1.in_playoffs)
    expect(page).to have_content(team_1.home_arena)
  end
# As a visitor
# When I visit '/players_table_name'
# Then I see each player in the system including the players's attributes:
  it "shows each player and their attributes" do
    player_1 = Players.create(healthy: true, weight: 210, name: "Joe Sakic", hometown: "Burnaby, BC")

    visit "/players"

    # save_and_open_page
    expect(current_path).to eq("/players")
    # expect(page).to have_content(team_1.weight)
    # expect(page).to have_content(team_1.name)
    # expect(page).to have_content(team_1.hometown)
    # expect(page).to have_content(team_1.healthy)
    # expect(page).to have_content(team_1.home_arena)
  end
end
