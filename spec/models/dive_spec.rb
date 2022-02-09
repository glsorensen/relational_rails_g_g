require 'rails_helper'

RSpec.describe Dive, type: :model do
  it {should belong_to :location}

  before (:each) do
    @san_diego = Location.create!(title: 'San Diego', has_reefs: false, num_of_species: 250, peak_season: 'April - September', region: "North America", water_temp: "50F - 62F", description: "Home of the NAVY SEALS")
    @navy_port = @san_diego.dives.create!(title: "Navy Port", beginner: false, max_depth:90, current_strength: "Strong", charter_loc: "Coronado Island, San Diego")
    @la_jolla = @san_diego.dives.create!(title: "La Jolla Cove", beginner: true, max_depth:45, current_strength: "Mild", charter_loc: "La Jolla, San Diego")
    @oceanside = @san_diego.dives.create!(title: "Ocienside Pier", beginner: true, max_depth:25, current_strength: "Mild", charter_loc: "Oceanside, San Diego")
  end
  describe 'alphabetical' do
    it 'sorts titles in alphabetical order' do
      results = [@la_jolla, @navy_port, @oceanside]
      expect(Dive.alphabetical).to eq(results)
    end
  end

  describe 'only true beginners' do
    it 'collects only true beginners' do
      results = [@la_jolla, @oceanside]
      expect(Dive.true_beginners).to eq(results)
    end
  end
end
