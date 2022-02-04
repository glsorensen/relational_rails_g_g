require 'rails_helper'

RSpec.describe 'dives index page', type: :feature do
  it 'shows each dive and their attributes' do
    location_1 = Location.create!(title: 'Key Largo', has_reefs: true, num_of_species: 600, peak_season: 'June - October', region: "North America", water_temp: "72F - 86F", description: "Great place")
    dive_1 = Dive.create!(title: "Flahertys Cave", location_id: location_1.id, beginner: false, max_depth:45, current_strength: "Strong", charter_loc: "Cozumel, MX")

    visit '/dive'
    save_and_open_page
    expect(current_path).to eq("/dive")
    expect(page).to have_content(dive_1.title)
    expect(page).to have_content(dive_1.location_id)
    expect(page).to have_content(dive_1.beginner)
    expect(page).to have_content(dive_1.max_depth)
    expect(page).to have_content(dive_1.current_strength)
    expect(page).to have_content(dive_1.charter_loc)
    expect(page).to have_content(dive_1.created_at)
    expect(page).to have_content(dive_1.updated_at)
  end
end
