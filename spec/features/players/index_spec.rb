require 'rails_helper'


 RSpec.describe 'players index page' do
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

RSpec.describe 'Player update from players index page' do
  before (:each) do
    @team_2 = Team.create!(in_playoffs: false, total_wins: 27, name: "Red Wings", city: "Detroit", home_arena: "Little Ceasers Arena")
    @player_1 = @team_2.players.create!(healthy: true, weight_lbs: 220, name: "Nick Lidstrom", hometown: "Stockholm, SWE")
    @player_2 = @team_2.players.create!(healthy: true, weight_lbs: 180, name: "Chris Osgood", hometown: "Davos, CH" )
    @player_3 = @team_2.players.create!(healthy: true, weight_lbs: 196, name: "Steve Yzerman", hometown: "Cranbrook, CAN")
  end

  it 'visits child index page and has an edit child info link' do
    visit('/players')

    expect(current_path).to eq('/players')
    expect(page).to have_link("Update: #{@player_1.name}")
    expect(page).to have_link("Update: #{@player_2.name}")
    expect(page).to have_link("Update: #{@player_3.name}")
  end


  it 'I click on link and takes me to edit page' do
    visit('/players')
    expect(current_path).to eq('/players')
    expect(page).to have_content("Chris Osgood")
    expect(page).to have_content("Steve Yzerman")
    click_on "Update: #{@player_3.name}"
    expect(current_path).to eq("/players/#{@player_3.id}/edit")
  end

  xit 'allows me to edit child like U11' do
    visit("/players/")
    expect(current_path).to eq("/players/")
    click_on "Update: #{@player_3.name}"
    expect(current_path).to eq("/players/#{@player_3.id}/edit")
    within('#Name') do
      fill_in 'Name', with: 'Test Player'
    end
    save_and_open_page
    click_on "Update Player"
    visit('/players')
    expect(page).to have_link("Update: Test Player")
    expect(page).to have_content("Test Player")
    expect(page).to_not have_content("Steve Yzerman")
  end

  it 'parent/child link takes me to child edit link' do
    visit("/teams/#{@team_2.id}/players")
    expect(current_path).to eq("/teams/#{@team_2.id}/players")
    expect(page).to have_content("Steve Yzerman")
    expect(page).to_not have_content("Test Player")
    click_on "Update: #{@player_3.name}"
    expect(current_path).to eq("/players/#{@player_3.id}/edit")
  end

  it 'shows a link for players to be deleted in the player index page' do
    visit("/players/")
    expect(current_path).to eq("/players/")
    expect(page).to have_content("Nick Lidstrom")
    expect(page).to have_content("Chris Osgood")
    expect(page).to have_content("Steve Yzerman")
    click_on "Delete: #{@player_3.name}"
    expect(current_path).to eq("/players")
    expect(page).to have_content("Nick Lidstrom")
    expect(page).to have_content("Chris Osgood")
    expect(page).to_not have_content("Steve Yzerman")

  end
end
