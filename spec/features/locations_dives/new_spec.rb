require "rails_helper"

RSpec.describe "Location-Dive Creation" do
  describe 'visit a Parent Childs Index page - ' do

    before (:each) do
      @san_diego = Location.create!(title: 'San Diego', has_reefs: false, num_of_species: 250, peak_season: 'April - September', region: "North America", water_temp: "50F - 62F", description: "Home of the NAVY SEALS")
      @navy_port = @san_diego.dives.create!(title: "Navy Port", beginner: false, max_depth:90, current_strength: "Strong", charter_loc: "Coronado Island, San Diego")
      @la_jolla = @san_diego.dives.create!(title: "La Jolla Cove", beginner: true, max_depth:45, current_strength: "Mild", charter_loc: "La Jolla, San Diego")
    end

    it "I see a link to add a new dive for that location - '/parents/:parent_id/child_table_name'" do
      visit "/locations/#{@san_diego.id}/dives"
      expect(current_path).to eq("/locations/#{@san_diego.id}/dives")
      expect(page).to have_link('Create New Dive')
      click_on "Create New Dive"
      expect(current_path).to eq("/locations/#{@san_diego.id}/dives/new")
    end

    it "I see a form to add a dive- '/parents/:parent_id/child_table_name/new'" do
      visit "/locations/#{@san_diego.id}/dives/new"
      expect(current_path).to eq("/locations/#{@san_diego.id}/dives/new")
      expect(page).to have_content("Title")
      expect(page).to have_content("Beginner")
      expect(page).to have_content("Max depth")
      expect(page).to have_content("Current strength")
      expect(page).to have_content("Charter loc")
    end

    it 'I fill in the form with attributes and I click the button "Create Dive"' do
      visit "/locations/#{@san_diego.id}/dives/new"
      expect(current_path).to eq("/locations/#{@san_diego.id}/dives/new")
      fill_in "Title", :with => 'San Ysidro'
      find('#beginner', :text => 'false').click
      fill_in "Max depth", :with => '25'
      find('#current_strength', :text => 'moderate').click
      fill_in "Charter loc", :with => 'Border City, CA'
      click_on "Save"
    end

    it 'I go to Location/Dive Index and see the new dive' do
      visit "/locations/#{@san_diego.id}/dives/new"
      expect(current_path).to eq("/locations/#{@san_diego.id}/dives/new")
      fill_in "Title", :with => 'San Ysidro'
      find('#beginner', :text => 'false').click
      fill_in "Max depth", :with => '25'
      find('#current_strength', :text => 'moderate').click

      fill_in "Charter loc", :with => 'Border City, CA'
      click_on "Save"
      visit "/locations/#{@san_diego.id}/dives"
      expect(page).to have_content("San Ysidro")
    end
  end
end
