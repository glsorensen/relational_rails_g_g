require 'rails_helper'

RSpec.describe 'dives index page', type: :feature do
  it 'shows each dive and their attributes' do
    dive_1 = Dive.create(title: "Flahertys Cave", location_id: 1, beginner: false, max_depth:45, current_strength: "Strong", charter_loc: "Cozumel, MX")

    visit '/dive'
    save_and_open_
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
end
