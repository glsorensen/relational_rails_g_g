require 'rails_helper'

RSpec.describe "Has index links on every page" do
  it "shows all index links on welcome page" do
    visit '/'
    expect(current_path).to eq('/')
    expect(page).to have_link("See All Locations")
    expect(page).to have_link("See All Dives")
    expect(page).to have_link("See All Teams")
    expect(page).to have_link("See All Players")
  end

  it 'shows locations index on all pages' do
    key_largo = Location.create!(title: 'Key Largo', has_reefs: true, num_of_species: 600, peak_season: 'June - October', region: "Carribean", water_temp: "72F - 86F", description: "Great place & warm weather!")
    sorensons_shore = Dive.create!(title: "Sorensons Shore", location_id: key_largo.id, beginner: false, max_depth:65, current_strength: "Moderate", charter_loc: "Cannon Beach, Key Largo")
    team_1 = Team.create!(in_playoffs: true, total_wins: 43, name: "Avalanche", city: "Colorado", home_arena: "Ball Arena")
    player_1 = Player.create!(healthy: true, weight_lbs: 210, name: "Joe Sakic", hometown: "Burnaby, CAN", team_id: team_1.id)
    visit("/")
    expect(page).to have_link("See All Teams")
    visit('/locations')
    expect(page).to have_link("See All Teams")
    visit('/locations/new')
    expect(page).to have_link("See All Teams")
    visit('/locations')
    expect(page).to have_link("See All Teams")
    visit("/locations/#{key_largo.id}")
    expect(page).to have_link("See All Teams")
    visit("/locations/#{key_largo.id}/dives")
    expect(page).to have_link("See All Teams")
    visit('/dive')
    expect(page).to have_link("See All Teams")
    visit("/dive/#{sorensons_shore.id}")
    expect(page).to have_link("See All Teams")
    visit('/teams')
    expect(page).to have_link("See All Teams")
    visit("/teams/#{team_1.id}")
    expect(page).to have_link("See All Teams")
    visit("/players/#{player_1.id}")
    expect(page).to have_link("See All Teams")
    visit('/players')
    expect(page).to have_link("See All Teams")
    visit("/teams/#{team_1.id}/players")
    expect(page).to have_link("See All Teams")
  end

  it 'shows dive index link on all pages' do
    key_largo = Location.create!(title: 'Key Largo', has_reefs: true, num_of_species: 600, peak_season: 'June - October', region: "Carribean", water_temp: "72F - 86F", description: "Great place & warm weather!")
    sorensons_shore = Dive.create!(title: "Sorensons Shore", location_id: key_largo.id, beginner: false, max_depth:65, current_strength: "Moderate", charter_loc: "Cannon Beach, Key Largo")
    team_1 = Team.create!(in_playoffs: true, total_wins: 43, name: "Avalanche", city: "Colorado", home_arena: "Ball Arena")
    player_1 = Player.create!(healthy: true, weight_lbs: 210, name: "Joe Sakic", hometown: "Burnaby, CAN", team_id: team_1.id)
    visit("/")
    expect(page).to have_link("See All Dives")
    visit('/locations')
    expect(page).to have_link("See All Dives")
    visit('/locations/new')
    expect(page).to have_link("See All Dives")
    visit('/locations')
    expect(page).to have_link("See All Dives")
    visit("/locations/#{key_largo.id}")
    expect(page).to have_link("See All Dives")
    visit("/locations/#{key_largo.id}/dives")
    expect(page).to have_link("See All Dives")
    visit('/dive')
    expect(page).to have_link("See All Dives")
    visit("/dive/#{sorensons_shore.id}")
    expect(page).to have_link("See All Dives")
    visit('/teams')
    expect(page).to have_link("See All Dives")
    visit("/teams/#{team_1.id}")
    expect(page).to have_link("See All Dives")
    visit("/players/#{player_1.id}")
    expect(page).to have_link("See All Dives")
    visit('/players')
    expect(page).to have_link("See All Dives")
    visit("/teams/#{team_1.id}/players")
    expect(page).to have_link("See All Dives")
  end

  it 'shows teams index on all pages' do
    key_largo = Location.create!(title: 'Key Largo', has_reefs: true, num_of_species: 600, peak_season: 'June - October', region: "Carribean", water_temp: "72F - 86F", description: "Great place & warm weather!")
    sorensons_shore = Dive.create!(title: "Sorensons Shore", location_id: key_largo.id, beginner: false, max_depth:65, current_strength: "Moderate", charter_loc: "Cannon Beach, Key Largo")
    team_1 = Team.create!(in_playoffs: true, total_wins: 43, name: "Avalanche", city: "Colorado", home_arena: "Ball Arena")
    player_1 = Player.create!(healthy: true, weight_lbs: 210, name: "Joe Sakic", hometown: "Burnaby, CAN", team_id: team_1.id)
    visit("/")
    expect(page).to have_link("See All Locations")
    visit('/locations')
    expect(page).to have_link("See All Locations")
    visit('/locations/new')
    expect(page).to have_link("See All Locations")
    visit('/locations')
    expect(page).to have_link("See All Locations")
    visit("/locations/#{key_largo.id}")
    expect(page).to have_link("See All Locations")
    visit("/locations/#{key_largo.id}/dives")
    expect(page).to have_link("See All Locations")
    visit('/dive')
    expect(page).to have_link("See All Locations")
    visit("/dive/#{sorensons_shore.id}")
    expect(page).to have_link("See All Locations")
    visit('/teams')
    expect(page).to have_link("See All Locations")
    visit("/teams/#{team_1.id}")
    expect(page).to have_link("See All Locations")
    visit("/players/#{player_1.id}")
    expect(page).to have_link("See All Locations")
    visit('/players')
    expect(page).to have_link("See All Locations")
    visit("/teams/#{team_1.id}/players")
    expect(page).to have_link("See All Locations")
  end

  it 'shows players index on all pages' do
    key_largo = Location.create!(title: 'Key Largo', has_reefs: true, num_of_species: 600, peak_season: 'June - October', region: "Carribean", water_temp: "72F - 86F", description: "Great place & warm weather!")
    sorensons_shore = Dive.create!(title: "Sorensons Shore", location_id: key_largo.id, beginner: false, max_depth:65, current_strength: "Moderate", charter_loc: "Cannon Beach, Key Largo")
    team_1 = Team.create!(in_playoffs: true, total_wins: 43, name: "Avalanche", city: "Colorado", home_arena: "Ball Arena")
    player_1 = Player.create!(healthy: true, weight_lbs: 210, name: "Joe Sakic", hometown: "Burnaby, CAN", team_id: team_1.id)
    visit("/")
    expect(page).to have_link("See All Players")
    visit('/locations')
    expect(page).to have_link("See All Players")
    visit('/locations/new')
    expect(page).to have_link("See All Players")
    visit('/locations')
    expect(page).to have_link("See All Players")
    visit("/locations/#{key_largo.id}")
    expect(page).to have_link("See All Players")
    visit("/locations/#{key_largo.id}/dives")
    expect(page).to have_link("See All Players")
    visit('/dive')
    expect(page).to have_link("See All Players")
    visit("/dive/#{sorensons_shore.id}")
    expect(page).to have_link("See All Players")
    visit('/teams')
    expect(page).to have_link("See All Players")
    visit("/teams/#{team_1.id}")
    expect(page).to have_link("See All Players")
    visit("/players/#{player_1.id}")
    expect(page).to have_link("See All Players")
    visit('/players')
    expect(page).to have_link("See All Players")
    visit("/teams/#{team_1.id}/players")
    expect(page).to have_link("See All Players")
  end
end
