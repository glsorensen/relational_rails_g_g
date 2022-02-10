require 'rails_helper'

RSpec.describe 'Child Delete' do
  describe 'delete a child from its show page' do
    before(:each) do
      @great_barrier_reef = Location.create!(title: 'Great Barrier Reef', has_reefs: true, num_of_species: 2500, peak_season: 'Year round', region: "Australia", water_temp: "62F - 86F", description: "Please save and preserve our reef!")
      @upolu_cay = @great_barrier_reef.dives.create!(title: "Upola Cay", beginner: true, max_depth:60, current_strength: "Mild", charter_loc: "Cain, Australia")
    end

    it 'I visit a child show page and see a link "Delete Child"' do
      visit("/dives/#{@upolu_cay.id}")
      expect(current_path).to eq("/dives/#{@upolu_cay.id}")
      expect(page).to have_link("Delete #{@upolu_cay.title}")
    end

    it 'I click on delete child link and the child is deleted' do
      visit("/dives")
      expect(page).to have_content(@upolu_cay.title)
      expect(page).to have_content(@upolu_cay.charter_loc)
      visit("/dives/#{@upolu_cay.id}")
      expect(current_path).to eq("/dives/#{@upolu_cay.id}")
      click_on "Delete #{@upolu_cay.title}"
      expect(current_path).to eq("/dives")
      expect(page).to_not have_content(@upolu_cay.title)
      expect(page).to_not have_content(@upolu_cay.charter_loc)
    end
  end
end
