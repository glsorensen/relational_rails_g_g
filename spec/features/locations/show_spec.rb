require 'rails_helper'

RSpec.describe 'locations show page', type: :feature do

  it 'finds locations by id and shows location attributes' do
    location_1 = Location.create!(title: 'Key Largo', has_reefs: true, num_of_species: 600, peak_season: 'June - October', region: "North America", water_temp: "72F - 86F", description: "Great place")

    visit "/locations/#{location_1.id}"

    expect(current_path).to eq("/locations/#{location_1.id}")
    expect(page).to have_content(location_1.title)
    expect(page).to have_content(location_1.has_reefs)
    expect(page).to have_content(location_1.num_of_species)
    expect(page).to have_content(location_1.peak_season)
    expect(page).to have_content(location_1.region)
    expect(page).to have_content(location_1.water_temp)
    expect(page).to have_content(location_1.description)

  end

  it 'shows count of dives on location show page' do
    location_1 = Location.create!(title: 'Key Largo', has_reefs: true, num_of_species: 600, peak_season: 'June - August', region: 'North America', water_temp: '62F-78F', description: 'Famous for diving')
    dive_1 = Dive.create!(title: "Flahertys Cave",  location_id: location_1.id, beginner: false, max_depth:45, current_strength: "Strong", charter_loc: "Miami, FL")
    dive_2 = Dive.create!(title: "Sorensons Shore", location_id: location_1.id, beginner: false, max_depth:65, current_strength: "Moderate", charter_loc: "Cozumel, MX")
    visit "/locations/#{location_1.id}"

    expect(current_path).to eq("/locations/#{location_1.id}")
    expect(page).to have_content("Number of dives: ")
    expect(page).to have_content(2)
  end

  it 'updates the location' do
    location_1 = Location.create!(title: 'Key Largo', has_reefs: true, num_of_species: 600, peak_season: 'June - August', region: 'North America', water_temp: '62F-78F', description: 'Famous for diving')
    dive_1 = Dive.create!(title: "Flahertys Cave",  location_id: location_1.id, beginner: false, max_depth:45, current_strength: "Strong", charter_loc: "Miami, FL")
    dive_2 = Dive.create!(title: "Sorensons Shore", location_id: location_1.id, beginner: false, max_depth:65, current_strength: "Moderate", charter_loc: "Cozumel, MX")
    visit "/locations/#{location_1.id}"
    expect(current_path).to eq("/locations/#{location_1.id}")
    click_on "Update #{location_1.title}"
    expect(current_path).to eq("/locations/#{location_1.id}/edit")
    fill_in "Title", :with => 'Fiji'
    find('#has_reefs', :text => 'false').click
    fill_in "Num of species", with: "1700"
    fill_in "Peak season", with: "Year round"
    fill_in "Region", with: "Carribean"
    fill_in "Water temp", with: "62F - 85F"
    fill_in "Description", with: "Tacos & Dives!"
    click_button "Update #{location_1.title}"
    expect(current_path).to eq("/locations/#{location_1.id}")

    expect(page).to have_content("Fiji")

  end
end
