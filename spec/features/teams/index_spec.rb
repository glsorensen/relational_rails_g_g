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
    team_1 = Team.create!(in_playoffs: true, total_wins: 43, name: "Avalanche", city: "Colorado", home_arena: "Ball Arena")
    player_1 = Player.create!(healthy: true, weight_lbs: 210, name: "Joe Sakic", hometown: "Burnaby, BC", team_id: team_1.id)

    visit "/players"

    expect(current_path).to eq("/players")
    expect(page).to have_content(player_1.weight_lbs)
    expect(page).to have_content(player_1.name)
    expect(page).to have_content(player_1.hometown)
    expect(page).to have_content(player_1.healthy)
  end
  it "shows each player and their attributes" do
    team_1 = Team.create!(in_playoffs: true, total_wins: 43, name: "Avalanche", city: "Colorado", home_arena: "Ball Arena")
    player_1 = Player.create!(healthy: true, weight_lbs: 210, name: "Joe Sakic", hometown: "Burnaby, BC", team_id: team_1.id)

    visit "/players/#{player_1.id}"

    expect(current_path).to eq("/players/#{player_1.id}")
    expect(page).to have_content(player_1.weight_lbs)
    expect(page).to have_content(player_1.name)
    expect(page).to have_content(player_1.hometown)
    expect(page).to have_content(player_1.healthy)
  end

  it "shows created at by order" do
    team_1 = Team.create!(in_playoffs: true, total_wins: 43, name: "Avalanche", city: "Colorado", home_arena: "Ball Arena")
    team_2 = Team.create!(in_playoffs: false, total_wins: 27, name: "Red Wings", city: "Detroit", home_arena: "Little Ceasers Arena")


    visit "/teams"
    # binding.pry

    expect(current_path).to eq('/teams')
    within "#teams" do
      expect(page.all('.team')[0]).to have_content("Avalanche")
      expect(page.all('.team')[1]).to have_content("Red Wings")
    end

  end

  describe "create new team link" do
    it 'has a link new team' do

      visit "/teams"

      expect(current_path).to eq("/teams")
      expect(page).to have_content("Create New Team")
      click_link "Create New Team"
      expect(current_path).to eq("/teams/new")
      fill_in "Name", with: "Kings"
      find('#in_playoffs', :text => 'false').click
      fill_in("Total wins", with: 40)
      # fill_in :placeholder => 'Total Wins', with: '40', visible: false
      fill_in "City", with: "Los Angeles"
      fill_in "Home arena", with: "Staples Center"
      click_on "Create Team"
    end

    it "has a working link to update the team" do

      team_11 = Team.create!(in_playoffs: true, total_wins: 43, name: "Oranges", city: "Colorado", home_arena: "Ball Arena")


      visit "/teams"

      expect(current_path).to eq("/teams")
      click_link "Update:" , match: :first
      expect(current_path).to eq("/teams/#{team_11.id}/edit")
      fill_in "Name", with: "Blues"
      find('#in_playoffs', :text => 'false').click
      fill_in("Total wins", with: 40)
      # fill_in :placeholder => 'Total Wins', with: '40', visible: false
      fill_in "City", with: "Los Angeles"
      fill_in "Home arena", with: "Staples Center"
      click_on "Update Team"
      expect(current_path).to eq("/teams/#{team_11.id}")
    end

  end
end
