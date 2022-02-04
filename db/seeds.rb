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
