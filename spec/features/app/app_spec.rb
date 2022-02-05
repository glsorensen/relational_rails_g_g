it 'shows dive index link on all pages' do
  location_1 = Location.create!(title: 'Key Largo', has_reefs: true, num_of_species: 600, peak_season: 'June - October', region: "North America", water_temp: "72F - 86F", description: "Great place")
  dive_1 = Dive.create!(title: "Flahertys Cave", location_id: location_1.id, beginner: false, max_depth:45, current_strength: "Strong", charter_loc: "Cozumel, MX")
  # User Story 8, Child Index Link
  # As a visitor
  # When I visit any page on the site
  # Then I see a link at the top of the page that takes me to the Child Index
  visit '/locations'
  expect(page).to have_link("See All Dives")
  visit '/locations/new'
  expect(page).to have_link("See All Dives")
