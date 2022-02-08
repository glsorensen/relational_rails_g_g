require 'rails_helper'

RSpec.describe "Parent Delete" do
  describe 'delete a parent and its children' do
    before(:each) do
      @great_barrier_reef = Location.create!(title: 'Great Barrier Reef', has_reefs: true, num_of_species: 2500, peak_season: 'Year round', region: "Australia", water_temp: "62F - 86F", description: "Please save and preserve our reef!")
      @upolu_cay = @great_barrier_reef.dives.create!(title: "Upola Cay", beginner: true, max_depth:60, current_strength: "Mild", charter_loc: "Cain, Australia")
      @coral_sea_trench = @great_barrier_reef.dives.create!(title: "Coral Sea Trench", beginner: true, max_depth:125, current_strength: "Strong", charter_loc: "Port Douglas, Australia")
      @ribbon_reef = @great_barrier_reef.dives.create!(title: "Ribbon Reef", beginner: true, max_depth:55, current_strength: "Moderate", charter_loc: "Agincourt, Australia")
    end

    it 'I visit a parent show page and see a link to delete parent' do
      visit("/locations/#{@great_barrier_reef.id}")
      expect(current_path).to eq("/locations/#{@great_barrier_reef.id}")
      expect(page).to have_link("Delete Great Barrier Reef")
    end

    it 'I clink the Delete Parent link, am rerouted to parent index where parent is deleted' do
      visit("/locations")
      expect(page).to have_content("Great Barrier Reef")
      visit("/locations/#{@great_barrier_reef.id}")
      expect(current_path).to eq("/locations/#{@great_barrier_reef.id}")
      click_on "Delete Great Barrier Reef"
      expect(page).to_not have_content("Great Barrier Reef")
    end

    it 'I am redirected to the parent index where parent is gone' do
      visit("/dive")
      expect(current_path).to eq("/dive")
      expect(page).to have_content(@upolu_cay.title)
      expect(page).to have_content(@coral_sea_trench.title)
      expect(page).to have_content(@ribbon_reef.title)
      visit("/locations")
      expect(page).to have_content("Great Barrier Reef")
      visit("/locations/#{@great_barrier_reef.id}")
      expect(current_path).to eq("/locations/#{@great_barrier_reef.id}")
      click_on "Delete Great Barrier Reef"
      visit("/dive")
      expect(current_path).to eq("/dive")
      expect(page).to_not have_content(@upolu_cay.title)
      expect(page).to_not have_content(@coral_sea_trench.title)
      expect(page).to_not have_content(@ribbon_reef.title)
    end
  end
end
