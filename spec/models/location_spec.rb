require 'rails_helper'

RSpec.describe Location do
  describe 'should have a title' do
   it {should validate_presence_of :title}
  end

  describe 'should have many dives' do
    it {should have_many :dives}
  end

  describe 'orders locations' do
    it 'should order by most recently created' do
      location_1 = Location.create!(title: 'Key Largo', created_at: "04-02-1989")
      location_2 = Location.create!(title: 'San Diego', created_at: "01-02-2000")
      location_3 = Location.create!(title: 'Great Barrier Reef', created_at: "01-01-2021")
      results = [location_3, location_2, location_1]
      expect(Location.created_by_order).to eq(results)
    end
  end

  describe "finds max depth greather than" do
    before (:each) do
      @san_diego = Location.create!(title: 'San Diego', has_reefs: false, num_of_species: 250, peak_season: 'April - September', region: "North America", water_temp: "50F - 62F", description: "Home of the NAVY SEALS")
      @navy_port = @san_diego.dives.create!(title: "Navy Port", beginner: false, max_depth:90, current_strength: "Strong", charter_loc: "Coronado Island, San Diego")
      @la_jolla = @san_diego.dives.create!(title: "La Jolla Cove", beginner: true, max_depth:45, current_strength: "Mild", charter_loc: "La Jolla, San Diego")
      @oceanside = @san_diego.dives.create!(title: "Ocienside Pier", beginner: true, max_depth:25, current_strength: "Mild", charter_loc: "Oceanside, San Diego")
    end
    it 'finds dives greater than' do
      results = [@navy_port, @la_jolla]
      expect(@san_diego.depth_greater_than("40")).to eq(results)
    end
  end
end
