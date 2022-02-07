require 'rails_helper'

RSpec.describe 'dives index page', type: :feature do
  it 'shows each dive and their attributes' do
    location_1 = Location.create!(title: 'Key Largo', has_reefs: true, num_of_species: 600, peak_season: 'June - October', region: "North America", water_temp: "72F - 86F", description: "Great place")
    dive_1 = Dive.create!(title: "Flahertys Cave", location_id: location_1.id, beginner: true, max_depth:45, current_strength: "Strong", charter_loc: "Cozumel, MX")

    visit '/dive'
    expect(current_path).to eq("/dive")
    expect(page).to have_content(dive_1.title)
    expect(page).to have_content(dive_1.location_id)
    expect(page).to have_content(dive_1.beginner)
    expect(page).to have_content(dive_1.max_depth)
    expect(page).to have_content(dive_1.current_strength)
    expect(page).to have_content(dive_1.charter_loc)
    expect(page).to have_content(dive_1.created_at)
    expect(page).to have_content(dive_1.updated_at)
  end

  describe 'it shows only true records' do
    before (:each) do
      @san_diego = Location.create!(title: 'San Diego', has_reefs: false, num_of_species: 250, peak_season: 'April - September', region: "North America", water_temp: "50F - 62F", description: "Home of the NAVY SEALS")
      @navy_port = @san_diego.dives.create!(title: "Navy Port", beginner: false, max_depth:90, current_strength: "Strong", charter_loc: "Coronado Island, San Diego")
      @la_jolla = @san_diego.dives.create!(title: "La Jolla Cove", beginner: true, max_depth:45, current_strength: "Mild", charter_loc: "La Jolla, San Diego")
      @oceanside = @san_diego.dives.create!(title: "Ocienside Pier", beginner: true, max_depth:25, current_strength: "Mild", charter_loc: "Oceanside, San Diego")
    end

    it 'visits child index page and only sees true beginners' do
      visit '/dive'
      expect(current_path).to eq("/dive")
      expect(page).to have_content(@la_jolla.title)
      expect(page).to have_content(@la_jolla.location_id)
      expect(page).to have_content(@la_jolla.beginner)
      expect(page).to have_content(@oceanside.title)
      expect(page).to have_content(@oceanside.location_id)
      expect(page).to have_content(@oceanside.beginner)
    end

    it 'visits child index page and only sees true beginners' do
      visit '/dive'
      expect(current_path).to eq("/dive")
      expect(page).to_not have_content(@navy_port.title)
      expect(page).to_not have_content(@navy_port.beginner)
    end

    describe 'Dive update from dive index page - U18' do
      before (:each) do
        @san_diego = Location.create!(title: 'San Diego', has_reefs: false, num_of_species: 250, peak_season: 'April - September', region: "North America", water_temp: "50F - 62F", description: "Home of the NAVY SEALS")
        @navy_port = @san_diego.dives.create!(title: "Navy Port", beginner: true, max_depth:90, current_strength: "Strong", charter_loc: "Coronado Island, San Diego")
        @la_jolla = @san_diego.dives.create!(title: "La Jolla Cove", beginner: true, max_depth:45, current_strength: "Mild", charter_loc: "La Jolla, San Diego")
        @oceanside = @san_diego.dives.create!(title: "Oceanside Pier", beginner: true, max_depth:25, current_strength: "Mild", charter_loc: "Oceanside, San Diego")
      end

      it 'visits child index page and has an edit child info link' do
        visit('/dive')
        expect(current_path).to eq('/dive')
        expect(page).to have_link("Edit #{@navy_port.title}")
        expect(page).to have_link("Edit #{@la_jolla.title}")
        expect(page).to have_link("Edit #{@oceanside.title}")
      end


      it 'I click on link and takes me to edit page' do
        visit('/dive')
        expect(current_path).to eq('/dive')
        expect(page).to have_content("Oceanside Pier")
        expect(page).to_not have_content("Solana Pier")
        click_on "Edit #{@oceanside.title}"
        expect(current_path).to eq("/dive/#{@oceanside.id}/edit")
      end

      it 'allows me to edit child like U11' do
        visit("/dive/#{@oceanside.id}/edit")
        expect(current_path).to eq("/dive/#{@oceanside.id}/edit")
        fill_in "Title", :with => 'Solana Pier'
        click_on "Update #{@oceanside.title}"
        visit('/dive')
        expect(current_path).to eq('/dive')
        expect(page).to have_link("Edit Solana Pier")
        expect(page).to have_content("Solana Pier")
        expect(page).to_not have_content("Oceanside Pier")
      end


      it 'visits parent/child index page and has an edit child info link' do
        visit("/locations/#{@san_diego.id}/dives")
        expect(current_path).to eq("/locations/#{@san_diego.id}/dives")
        expect(page).to have_link("Edit #{@navy_port.title}")
        expect(page).to have_link("Edit #{@la_jolla.title}")
        expect(page).to have_link("Edit #{@oceanside.title}")
      end


      it 'parent/child link takes me to child edit link' do
        visit("/locations/#{@san_diego.id}/dives")
        expect(current_path).to eq("/locations/#{@san_diego.id}/dives")
        expect(page).to have_content("Oceanside Pier")
        expect(page).to_not have_content("Solana Pier")
        click_on "Edit #{@oceanside.title}"
        expect(current_path).to eq("/dive/#{@oceanside.id}/edit")
      end
    end
  end
end
