
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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

key_largo = Location.create!(title: 'Key Largo', has_reefs: true, num_of_species: 600, peak_season: 'June - October', region: "Carribean", water_temp: "72F - 86F", description: "Great place & warm weather!")
san_diego = Location.create!(title: 'San Diego', has_reefs: false, num_of_species: 250, peak_season: 'April - September', region: "North America", water_temp: "50F - 62F", description: "Home of the NAVY SEALS")
great_barrier_reef = Location.create!(title: 'Great Barrier Reef', has_reefs: true, num_of_species: 2500, peak_season: 'Year round', region: "Australia", water_temp: "62F - 86F", description: "Please save and preserve our reef!")
flahertys_cave = Dive.create!(title: "Flahertys Cave", location_id: key_largo.id, beginner: false, max_depth:45, current_strength: "Strong", charter_loc: "Port Largo Villasm Key Largo")
sorensons_shore = Dive.create!(title: "Sorensons Shore", location_id: key_largo.id, beginner: false, max_depth:65, current_strength: "Moderate", charter_loc: "Cannon Beach, Key Largo")
jackson_reef = Dive.create!(title: "Jacksons Reef", location_id: key_largo.id, beginner: true, max_depth:35, current_strength: "Mild", charter_loc: "Marina Del Mar, Key Largo")
navy_port = Dive.create!(title: "Navy Port", location_id: san_diego.id, beginner: false, max_depth:90, current_strength: "Strong", charter_loc: "Coronado Island, San Diego")
la_jolla = Dive.create!(title: "La Jolla Cove", location_id: san_diego.id, beginner: true, max_depth:45, current_strength: "Mild", charter_loc: "La Jolla, San Diego")
oceanside = Dive.create!(title: "Ocienside Pier", location_id: san_diego.id, beginner: true, max_depth:25, current_strength: "Mild", charter_loc: "Oceanside, San Diego")
upolu_cay = Dive.create!(title: "Upola Cay", location_id: great_barrier_reef.id, beginner: true, max_depth:60, current_strength: "Mild", charter_loc: "Cain, Australia")
coral_sea_trench = Dive.create!(title: "Coral Sea Trench", location_id: great_barrier_reef.id, beginner: false, max_depth:125, current_strength: "Strong", charter_loc: "Port Douglas, Australia")
ribbon_reef = Dive.create!(title: "Ribbon Reef", location_id: great_barrier_reef.id, beginner: false, max_depth:55, current_strength: "Moderate", charter_loc: "Agincourt, Australia")
