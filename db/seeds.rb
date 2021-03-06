
@key_largo = Location.create!(title: 'Key Largo', has_reefs: true, num_of_species: 600, peak_season: 'June - October', region: "Carribean", water_temp: "72F - 86F", description: "Great place & warm weather!")
@flahertys_cave = @key_largo.dives.create!(title: "Flahertys Cave", beginner: false, max_depth:45, current_strength: "Strong", charter_loc: "Port Largo Villasm Key Largo")
@sorensons_shore = @key_largo.dives.create!(title: "Sorensons Shore", beginner: false, max_depth:65, current_strength: "Moderate", charter_loc: "Cannon Beach, Key Largo")
@jackson_reef = @key_largo.dives.create!(title: "Jacksons Reef", beginner: true, max_depth:35, current_strength: "Mild", charter_loc: "Marina Del Mar, Key Largo")

@san_diego = Location.create!(title: 'San Diego', has_reefs: false, num_of_species: 250, peak_season: 'April - September', region: "North America", water_temp: "50F - 62F", description: "Home of the NAVY SEALS")
@navy_port = @san_diego.dives.create!(title: "Navy Port", beginner: false, max_depth:90, current_strength: "Strong", charter_loc: "Coronado Island, San Diego")
@la_jolla = @san_diego.dives.create!(title: "La Jolla Cove", beginner: true, max_depth:45, current_strength: "Mild", charter_loc: "La Jolla, San Diego")
@oceanside = @san_diego.dives.create!(title: "Ocienside Pier", beginner: true, max_depth:25, current_strength: "Mild", charter_loc: "Oceanside, San Diego")

@great_barrier_reef = Location.create!(title: 'Great Barrier Reef', has_reefs: true, num_of_species: 2500, peak_season: 'Year round', region: "Australia", water_temp: "62F - 86F", description: "Please save and preserve our reef!")
@upolu_cay = @great_barrier_reef.dives.create!(title: "Upola Cay", beginner: true, max_depth:60, current_strength: "Mild", charter_loc: "Cain, Australia")
@coral_sea_trench = @great_barrier_reef.dives.create!(title: "Coral Sea Trench", beginner: false, max_depth:125, current_strength: "Strong", charter_loc: "Port Douglas, Australia")
@ribbon_reef = @great_barrier_reef.dives.create!(title: "Ribbon Reef", beginner: false, max_depth:55, current_strength: "Moderate", charter_loc: "Agincourt, Australia")


team_1 = Team.create!(in_playoffs: true, total_wins: 43, name: "Avalanche", city: "Colorado", home_arena: "Ball Arena")
player_1 = Player.create!(healthy: true, weight_lbs: 210, name: "Joe Sakic", hometown: "Burnaby, CAN", team_id: team_1.id)
player_2 = Player.create!(healthy: true, weight_lbs: 230, name: "Rob Blake", hometown: "Edmonton, CAN" , team_id: team_1.id)
player_ = Player.create!(healthy: false, weight_lbs: 190, name: "Patrick Roy", hometown: "Quebeq City, CAN" , team_id: team_1.id)

team_2 = Team.create!(in_playoffs: false, total_wins: 27, name: "Red Wings", city: "Detroit", home_arena: "Little Ceasers Arena")
player_1 = Player.create!(healthy: true, weight_lbs: 220, name: "Nick Lidstrom", hometown: "Stockholm, SWE", team_id: team_2.id)
player_2 = Player.create!(healthy: true, weight_lbs: 180, name: "Chris Osgood", hometown: "Davos, CH" , team_id: team_2.id)
player_ = Player.create!(healthy: false, weight_lbs: 196, name: "Steve Yzerman", hometown: "Cranbrook, CAN" , team_id: team_2.id)

team_3 = Team.create!(in_playoffs: true, total_wins: 35, name: "Stars", city: "Dallas", home_arena: "American Airlines Center")
player_1 = Player.create!(healthy: true, weight_lbs: 215, name: "Brenden Morrow", hometown: "Carlyle, CAN", team_id: team_3.id)
player_2 = Player.create!(healthy: true, weight_lbs: 200, name: "Ed Belfour", hometown: "Carman, CAN" , team_id: team_3.id)
player_ = Player.create!(healthy: false, weight_lbs: 187, name: "Mike Maodano", hometown: "Livonia, USA" , team_id: team_3.id)
