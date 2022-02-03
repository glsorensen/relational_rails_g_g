require 'rails_helper'

RSpec.describe 'locations index page', type: :feature do
  it 'can see all locations by name' do
    location_1 = Locations.create(title: 'Key Largo')
    location_2 = Locations.create(title: 'Great Barrier Reef')
    location_3 = Locations.create(title: 'San Diego')

    visit '/locations'
    expect(current_path).to eq('/locations')
    expect(page).to have_content(location_1.title)
    expect(page).to have_content(location_2.title)
    expect(page).to have_content(location_3.title)
  end

# User Story 5, Parent Children Index (x2)
# As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that Parent with each Child's attributes:
  it 'finds location and shows all dives with attributes for that location' do
    location_1 = Locations.create(title: 'Key Largo')
    dive_1 = Dive.create(title: "Flahertys Cave", location_id: location_1.id, beginner: false, max_depth:45, current_strength: "Strong", charter_loc: "Cozumel, MX")
    dive_2 = Dive.create(title: "Sorensons Shore", location_id: location_1.id, beginner: false, max_depth:65, current_strength: "Moderate", charter_loc: "Cozumel, MX")

    visit "/locations/#{location_1.id}/dives"
    save_and_open_page
    expect(current_path).to eq("/locations/#{location_1.id}/dives")
    expect(page).to have_content(location_1.title)
    expect(page).to have_content(dive_1.title)
    expect(page).to have_content(dive_1.location_id)
    expect(page).to have_content(dive_1.beginner)
    expect(page).to have_content(dive_1.max_depth)
    expect(page).to have_content(dive_1.current_strength)
    expect(page).to have_content(dive_1.charter_loc)
    expect(page).to have_content(dive_1.created_at)
    expect(page).to have_content(dive_1.updated_at)
    expect(page).to have_content(dive_2.title)
    expect(page).to have_content(dive_2.location_id)
    expect(page).to have_content(dive_2.beginner)
    expect(page).to have_content(dive_2.max_depth)
    expect(page).to have_content(dive_2.current_strength)
    expect(page).to have_content(dive_2.charter_loc)
    expect(page).to have_content(dive_2.created_at)
    expect(page).to have_content(dive_2.updated_at)
  end
end
