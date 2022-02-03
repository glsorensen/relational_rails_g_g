require 'rails_helper'

RSpec.describe 'locations index page', type: :feature do
  it 'can see all locations by name' do
    location_1 = Location.create!(title: 'Key Largo', has_reefs: true, num_of_species: 600, peak_season: 'June - October', region: "North America", water_temp: "72F - 86F", description: "Great place")
    location_2 = Location.create!(title: 'San Diego', has_reefs: false, num_of_species: 250, peak_season: 'April - September', region: "North America", water_temp: "50F - 62F", description: "NAVY SEALS")
    location_3 = Location.create!(title: 'Great Barrier Reef', has_reefs: true, num_of_species: 2500, peak_season: 'Year round', region: "Australia", water_temp: "62F - 86F", description: "Famous")


    visit '/locations'
    expect(current_path).to eq('/locations')
    expect(page).to have_content(location_1.title)
    expect(page).to have_content(location_2.title)
    expect(page).to have_content(location_3.title)
  end
end
