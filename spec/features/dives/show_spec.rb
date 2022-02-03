require 'rails_helper'

RSpec.describe 'dives show page', type: :feature do
  # User Story 4, Child Show (x2)
  #
  # As a visitor
  # When I visit '/child_table_name/:id'
  # Then I see the child with that id including the child's attributes:
  # it 'shows each dive and their attributes' do
    it 'finds dive by id and shows dive attributes' do
    dive_1 = Dive.create(title: "Flahertys Cave", location_id: 1, beginner: false, max_depth:45, current_strength: "Strong", charter_loc: "Cozumel, MX")

    visit "/dive/#{dive_1.id}"
    # save_and_open_page
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
end
