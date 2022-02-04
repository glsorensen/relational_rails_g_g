require 'rails_helper'

RSpec.describe Location do
  describe 'should have a title' do
   it {should validate_presence_of :title}
  end

  describe 'should have many dives' do
    it {should have_many :dives}
  end

  describe 'orders locations' do
    before(:each) do
      location_1 = Location.create!(title: 'Key Largo', created_at: "04-02-1989")
      location_2 = Location.create!(title: 'San Diego', created_at: "01-02-2000")
      location_3 = Location.create!(title: 'Great Barrier Reef', created_at: "01-01-2021")
    end

    it 'should order by most recently created' do
      locations = Location.all
      results = [location_3, location_2, location_1]
      expect(Location.created_by_order).to eq(results)
    end
  end
end
