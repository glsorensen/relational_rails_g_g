require 'rails_helper'
RSpec.describe 'dive_locations page', type: :feature do
  it 'finds location and shows all dives with attributes for that location' do
    location_1 = Location.create!(title: 'Key Largo', has_reefs: true, num_of_species: 600, peak_season: 'June - August', region: 'North America', water_temp: '62F-78F', description: 'Famous for diving')
    dive_1 = Dive.create!(title: "Flahertys Cave",  location_id: location_1.id, beginner: false, max_depth:45, current_strength: "Strong", charter_loc: "Miami, FL")
    dive_2 = Dive.create!(title: "Sorensons Shore", location_id: location_1.id, beginner: false, max_depth:65, current_strength: "Moderate", charter_loc: "Cozumel, MX")

    visit "/locations/#{location_1.id}/dives"
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

  it 'has a link to all dives for a location' do
    location_1 = Location.create!(title: 'Key Largo', has_reefs: true, num_of_species: 600, peak_season: 'June - August', region: 'North America', water_temp: '62F-78F', description: 'Famous for diving')
    dive_1 = Dive.create!(title: "Flahertys Cave",  location_id: location_1.id, beginner: false, max_depth:45, current_strength: "Strong", charter_loc: "Miami, FL")
    dive_2 = Dive.create!(title: "Sorensons Shore", location_id: location_1.id, beginner: false, max_depth:65, current_strength: "Moderate", charter_loc: "Cozumel, MX")

    visit "/locations/#{location_1.id}"
    expect(current_path).to eq("/locations/#{location_1.id}")
    expect(page).to have_content("See All #{location_1.title} Dives")
    click_link "See All #{location_1.title} Dives"
    expect(current_path).to eq("/locations/#{location_1.id}/dives")
  end

  describe 'sorts dives by alphabetical order' do
    before (:each) do
      @san_diego = Location.create!(title: 'San Diego', has_reefs: false, num_of_species: 250, peak_season: 'April - September', region: "North America", water_temp: "50F - 62F", description: "Home of the NAVY SEALS")
      @navy_port = @san_diego.dives.create!(title: "Navy Port", beginner: false, max_depth:90, current_strength: "Strong", charter_loc: "Coronado Island, San Diego")
      @la_jolla = @san_diego.dives.create!(title: "La Jolla Cove", beginner: true, max_depth:45, current_strength: "Mild", charter_loc: "La Jolla, San Diego")
      @oceanside = @san_diego.dives.create!(title: "Ocienside Pier", beginner: true, max_depth:25, current_strength: "Mild", charter_loc: "Oceanside, San Diego")
    end

    it "I see a link to sort A-Z on page - '/locations/:id/dives'" do
      visit("/locations/#{@san_diego.id}/dives")
      expect(current_path).to eq("/locations/#{@san_diego.id}/dives")
      expect(page).to have_link("Sort Dives: A-Z")
      click_link "Sort Dives: A-Z"
      expect(current_path).to eq("/locations/#{@san_diego.id}/dives")
    end

    it "I click link and am taken back to page where dives are sorted A-Z - '/locations/:id/dives'" do
      visit("/locations/#{@san_diego.id}/dives")
      click_link "Sort Dives: A-Z"
      expect(current_path).to eq("/locations/#{@san_diego.id}/dives")

      within '#dives' do
        expect(page.all('.dive')[0]).to have_content('La Jolla Cove')
        expect(page.all('.dive')[1]).to have_content("Navy Port")
        expect(page.all('.dive')[2]).to have_content("Ocienside Pier")
      end
    end
  end

  describe "Records Over Given Threshold- U21" do
    before (:each) do
      @san_diego = Location.create!(title: 'San Diego', has_reefs: false, num_of_species: 250, peak_season: 'April - September', region: "North America", water_temp: "50F - 62F", description: "Home of the NAVY SEALS")
      @navy_port = @san_diego.dives.create!(title: "Navy Port", beginner: false, max_depth:90, current_strength: "Strong", charter_loc: "Coronado Island, San Diego")
      @la_jolla = @san_diego.dives.create!(title: "La Jolla Cove", beginner: true, max_depth:45, current_strength: "Mild", charter_loc: "La Jolla, San Diego")
      @oceanside = @san_diego.dives.create!(title: "Oceanside Pier", beginner: true, max_depth:25, current_strength: "Mild", charter_loc: "Oceanside, San Diego")
    end
    it 'When I visit the parent/chind index i see a form that allow me to input a number value' do
      visit("/locations/#{@san_diego.id}/dives")
      expect(page).to have_field(:search)
    end

    it "when I input a number and click the submit buttom, I am brought back to current index page with only those records" do
      visit("/locations/#{@san_diego.id}/dives")
      expect(page).to have_content("Oceanside Pier")
      fill_in :search, :with => "40"
      click_on "Find Dives"
      expect(current_path).to eq("/locations/#{@san_diego.id}/dives")
      expect(page).to have_content("Navy Port")
      expect(page).to have_content("La Jolla Cove")
      expect(page).to_not have_content("Oceanside Pier")
    end
  end
end
