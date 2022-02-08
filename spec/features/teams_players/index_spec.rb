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
    click_link "Add New Player"
    expect(current_path).to eq("/teams/#{team_1.id}/players/new")
    fill_in "Name", with: "GOldberg"
    find('#healthy').click
    fill_in("Weight lbs", with: 40)
    # fill_in :placeholder => 'Total Wins', with: '40', visible: false
    fill_in "Hometown", with: "Los Angeles"
    click_on "Create Player"
    expect(current_path).to eq("/teams/#{team_1.id}/players")
  end

  describe 'sorts players by alphabetical order' do
    before (:each) do
      @team_2 = Team.create!(in_playoffs: false, total_wins: 27, name: "Red Wings", city: "Detroit", home_arena: "Little Ceasers Arena")
      @player_1 = @team_2.players.create!(healthy: true, weight_lbs: 220, name: "Nick Lidstrom", hometown: "Stockholm, SWE")
      @player_2 = @team_2.players.create!(healthy: true, weight_lbs: 180, name: "Chris Osgood", hometown: "Davos, CH" )
      @player_3 = @team_2.players.create!(healthy: false, weight_lbs: 196, name: "Steve Yzerman", hometown: "Cranbrook, CAN")
    end

    it "I see a link to sort A-Z on page - '/teams/:id/players'" do
      visit("/teams/#{@team_2.id}/players")
      expect(current_path).to eq("/teams/#{@team_2.id}/players")
      expect(page).to have_link("Sort A-Z")
      click_link "Sort A-Z"
      expect(current_path).to eq("/teams/#{@team_2.id}/players")
    end

    it "I click link and am taken back to page where players are sorted A-Z - '/teams/:id/players'" do
      visit("/teams/#{@team_2.id}/players")
      # save_and_open_page
      click_link "Sort A-Z"
      expect(current_path).to eq("/teams/#{@team_2.id}/players")

      within "#players" do
        # expect(page.find('li:nth-child(1)')).to have_content("Chris Osgood")
        # expect(page.find('li:nth-child(2)')).to have_content("Nick Lidstrom")
        # expect(page.find('li:nth-child(3)')).to have_content("Steve Yzerman")
        expect(page.all('.player')[0]).to have_content("Chris Osgood")
        expect(page.all('.player')[1]).to have_content("Nick Lidstrom")
        expect(page.all('.player')[2]).to have_content("Steve Yzerman")
       end
    end
  end


end
