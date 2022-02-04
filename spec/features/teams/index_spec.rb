require 'rails_helper'

RSpec.describe "Team index page", type: :feature do

  it "can see all teams by name" do
    team_1 = Team.create!(name: "Avalanche")
    team_2 = Team.create!(name: "Red Wings")
    team_3 = Team.create!(name: "Lightning")

    visit "/teams"

    expect(current_path).to eq('/teams')
    expect(page).to have_content(team_1.name)
    expect(page).to have_content(team_2.name)
    expect(page).to have_content(team_3.name)
  end

  it "finds team by :id and shows teams attributes" do
    team_1 = Team.create!(in_playoffs: true, total_wins: 43, name: "Avalanche", city: "Colorado", home_arena: "Ball Arena")

    visit "/teams/#{team_1.id}"

    expect(current_path).to eq("/teams/#{team_1.id}")
    expect(page).to have_content(team_1.total_wins)
    expect(page).to have_content(team_1.name)
    expect(page).to have_content(team_1.city)
    expect(page).to have_content(team_1.in_playoffs)
    expect(page).to have_content(team_1.home_arena)
  end

  it "shows each player in system and their attributes" do
    player_1 = Player.create!(healthy: true, weight_lbs: 210, name: "Joe Sakic", hometown: "Burnaby, BC")

    visit "/players"

    expect(current_path).to eq("/players")
    expect(page).to have_content(player_1.weight_lbs)
    expect(page).to have_content(player_1.name)
    expect(page).to have_content(player_1.hometown)
    expect(page).to have_content(player_1.healthy)
  end
  it "shows each player and their attributes" do
    player_1 = Player.create!(healthy: true, weight_lbs: 210, name: "Joe Sakic", hometown: "Burnaby, BC")

    visit "/players/#{player_1.id}"

    expect(current_path).to eq("/players/#{player_1.id}")
    expect(page).to have_content(player_1.weight_lbs)
    expect(page).to have_content(player_1.name)
    expect(page).to have_content(player_1.hometown)
    expect(page).to have_content(player_1.healthy)
  end
end
