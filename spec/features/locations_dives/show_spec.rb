require 'rails_helper'
RSpec.describe 'dive_locations index page', type: :feature do
  it 'finds location and shows all dives with attributes for that location' do
    location_1 = Location.create!(title: 'Key Largo', has_reefs: true, num_of_species: 600, peak_season: 'June - August', region: 'North America', water_temp: '62F-78F', description: 'Famous for diving')
    dive_1 = Dive.create!(title: "Flahertys Cave",  location_id: location_1.id, beginner: false, max_depth:45, current_strength: "Strong", charter_loc: "Miami, FL")
    dive_2 = Dive.create!(title: "Sorensons Shore", location_id: location_1.id, beginner: false, max_depth:65, current_strength: "Moderate", charter_loc: "Cozumel, MX")

    visit "/locations/#{location_1.id}/dives"
    save_and_open_page
    expect(current_path).to eq("/locations/#{location_1.id}/dives")
    expect(page).to have_content(location_1.title)
    expect(page).to have_content(dive_1.title)
    expect(page).to have_content(dive_1.beginner)
    expect(page).to have_content(dive_1.max_depth)
    expect(page).to have_content(dive_1.current_strength)
    expect(page).to have_content(dive_1.charter_loc)
    expect(page).to have_content(dive_1.created_at)
    expect(page).to have_content(dive_1.updated_at)
    expect(page).to have_content(dive_2.title)
    expect(page).to have_content(dive_2.beginner)
    expect(page).to have_content(dive_2.max_depth)
    expect(page).to have_content(dive_2.current_strength)
    expect(page).to have_content(dive_2.charter_loc)
    expect(page).to have_content(dive_2.created_at)
    expect(page).to have_content(dive_2.updated_at)
  end

  xit 'user story 10' do
    # User Story 10, Parent Child Index Link
    #
    # As a visitor
    # When I visit a parent show page ('/parents/:id')
    # Then I see a link to take me to that parent's `child_table_name` page ('/parents/:id/child_table_name')
  end


end
