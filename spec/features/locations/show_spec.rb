require 'rails_helper'

RSpec.describe 'locations show page', type: :feature do

  it 'finds locations by id and shows location attributes' do
    location_1 = Locations.create(title: 'Key Largo', has_reefs: true, num_of_species: 600, peak_season: 'June - October', region: "North America", water_temp: "72F - 86F", description: "Great place")

    visit "/locations/#{location_1.id}"

    save_and_open_page
    expect(current_path).to eq("/locations/#{location_1.id}")
    expect(page).to have_content(location_1.title)
    expect(page).to have_content(location_1.has_reefs)
    expect(page).to have_content(location_1.num_of_species)
    expect(page).to have_content(location_1.peak_season)
    expect(page).to have_content(location_1.region)
    expect(page).to have_content(location_1.water_temp)
    expect(page).to have_content(location_1.description)
  end

end
