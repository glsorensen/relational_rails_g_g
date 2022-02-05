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
end
