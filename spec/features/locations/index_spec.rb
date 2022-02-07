require 'rails_helper'

RSpec.describe 'locations index page', type: :feature do
  describe 'User Story 1' do
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

  describe 'shows created_at by order' do
    it 'can order locations by creation time, providing that time' do
      location_1 = Location.create!(title: 'Key Largo', created_at: "04-02-1989")
      location_2 = Location.create!(title: 'San Diego', created_at: "01-02-2000")
      location_3 = Location.create!(title: 'Great Barrier Reef', created_at: "01-01-2021")
      visit '/locations'
      expect(current_path).to eq('/locations')
      within '#locations' do
        expect(page.all('.location')[0]).to have_content('Great Barrier Reef')
        expect(page.all('.location')[1]).to have_content(location_2.title)
        expect(page.all('.location')[2]).to have_content(location_1.title)
      end
    end
  end

  describe 'create new location link' do
    it 'has a link to new location' do
      location_1 = Location.create!(title: 'Key Largo', created_at: "04-02-1989")
      visit '/locations'
      expect(current_path).to eq('/locations')
      click_on "Create New Location"
      expect(current_path).to eq('/locations/new')
      fill_in "Title", with: "Cozumel, MX"
      find('#has_reefs', :text => 'false').click
      fill_in "Num of species", with: "1700"
      fill_in "Peak season", with: "Year round"
      fill_in "Region", with: "Carribean"
      fill_in "Water temp", with: "62F - 85F"
      fill_in "Description", with: "Tacos & Dives!"
      click_on "Create Location"
    end

    describe 'Location update from Location Index Page - U17' do
      before (:each) do
        @location_1 = Location.create!(title: 'Key Largo', has_reefs: true, num_of_species: 600, peak_season: 'June - October', region: "North America", water_temp: "72F - 86F", description: "Great place")
        @location_2 = Location.create!(title: 'San Diego', has_reefs: false, num_of_species: 250, peak_season: 'April - September', region: "North America", water_temp: "50F - 62F", description: "NAVY SEALS")
        @location_3 = Location.create!(title: 'Great Barrier Reef', has_reefs: true, num_of_species: 2500, peak_season: 'Year round', region: "Australia", water_temp: "62F - 86F", description: "Famous")
      end

      it 'I visit parent index page, and see a link to edit parent' do
        visit('/locations')
        expect(current_path).to eq('/locations')
        expect(page).to have_link("Edit #{@location_1.title}")
        expect(page).to have_link("Edit #{@location_2.title}")
        expect(page).to have_link("Edit #{@location_3.title}")
      end

      it 'I click link and am taken to parent edit page' do
        visit('/locations')
        expect(current_path).to eq('/locations')
        expect(page).to have_content("Key Largo")
        expect(page).to_not have_content("Key West")
        click_on "Edit #{@location_1.title}"
        expect(current_path).to eq("/locations/#{@location_1.id}/edit")
      end

      it 'allows me to edit parent like U4' do
        visit("locations/#{@location_1.id}/edit")
        fill_in "Title", :with => 'Key West'
        click_on "Update #{@location_1.title}"
        visit('/locations')
        expect(current_path).to eq('/locations')
        save_and_open_page
        expect(page).to have_link("Edit Key West")
        expect(page).to have_content("Key West")
        expect(page).to_not have_content("Key Largo")
      end
    end
  end
end
