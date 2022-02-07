require 'rails_helper'

RSpec.describe 'dives show page', type: :feature do
    it 'finds dive by id and shows dive attributes' do
    location_1 = Location.create!(title: 'Key Largo', has_reefs: true, num_of_species: 600, peak_season: 'June - October', region: "North America", water_temp: "72F - 86F", description: "Great place")
    dive_1 = Dive.create(title: "Flahertys Cave", location_id: location_1.id, beginner: false, max_depth:45, current_strength: "Strong", charter_loc: "Cozumel, MX")

    visit "/dive/#{dive_1.id}"

    expect(current_path).to eq("/dive/#{dive_1.id}")
    expect(page).to have_content(dive_1.title)
    expect(page).to have_content(dive_1.location_id)
    expect(page).to have_content(dive_1.beginner)
    expect(page).to have_content(dive_1.max_depth)
    expect(page).to have_content(dive_1.current_strength)
    expect(page).to have_content(dive_1.charter_loc)
    expect(page).to have_content(dive_1.created_at)
    expect(page).to have_content(dive_1.updated_at)
  end


  describe "Dive Update" do
    before (:each) do
      @great_barrier_reef = Location.create!(title: 'Great Barrier Reef', has_reefs: true, num_of_species: 2500, peak_season: 'Year round', region: "Australia", water_temp: "62F - 86F", description: "Please save and preserve our reef!")
      @coral_sea_trench = @great_barrier_reef.dives.create!(title: "Coral Sea Trench", beginner: false, max_depth:125, current_strength: "Strong", charter_loc: "Port Douglas, Australia")
    end

    it "I see a link to update that Dive 'Update Dive'- '/dive/:id'" do
      visit("/dive/#{@coral_sea_trench.id}")
      expect(current_path).to eq("/dive/#{@coral_sea_trench.id}")
      expect(page).to have_link("Update #{@coral_sea_trench.title}")
      click_on "Update #{@coral_sea_trench.title}"
      expect(current_path).to eq("/dive/#{@coral_sea_trench.id}/edit")
      save_and_open_page
    end

    it "I see a from, I edit attributes and click submit - '/dive/:id/edit'" do
      visit("/dive/#{@coral_sea_trench.id}/edit")
      expect(current_path).to eq("/dive/#{@coral_sea_trench.id}/edit")
      fill_in "Title", :with => "Eagle Ray Sea Trench"
      find('#beginner_select', :text => 'True').click
      fill_in "Max depth", :with => '25'
      find('#current_strength_select', :text => 'Moderate').click
      fill_in "Region", :with => 'Oceania'
      fill_in "Charter loc", :with => 'Sydney, AUS'
      click_on "Update #{@coral_sea_trench.title}"
    end

    it "I click 'Update Dive', am redirected to show page where updated info is"  do
      visit("/dive/#{@coral_sea_trench.id}/edit")
      expect(current_path).to eq("/dive/#{@coral_sea_trench.id}/edit")
      fill_in "Title", :with => "Eagle Ray Sea Trench"
      find('#beginner_select', :text => 'True').click
      fill_in "Max depth", :with => '25'
      find('#current_strength_select', :text => 'Moderate').click
      fill_in "Region", :with => 'Oceania'
      fill_in "Charter loc", :with => 'Sydney, AUS'
      click_on "Update #{@coral_sea_trench.title}"
      visit("/dive/#{@coral_sea_trench.id}")
      expect(current_path).to eq("/dive/#{@coral_sea_trench.id}")
      expect(page).to have_content("Eagle Ray Sea Trench")
    end
  end
end
