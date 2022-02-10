require 'rails_helper'

RSpec.describe Team, type: :model do
  it {should have_many :players}
  it {should validate_presence_of :name}
  # it {should validate_presence_of :age}

  describe 'instance methods' do
    before :each do
      @team_1 = Team.create!(in_playoffs: true, total_wins: 43, name: "Avalanche", city: "Colorado", home_arena: "Ball Arena")
      @team_2 = Team.create!(in_playoffs: false, total_wins: 27, name: "Red Wings", city: "Detroit", home_arena: "Little Ceasers Arena")
      @team_3 = Team.create!(in_playoffs: true, total_wins: 35, name: "Stars", city: "Dallas", home_arena: "American Airlines Center")


      @player_1 = Player.create!(healthy: true, weight_lbs: 210, name: "Joe Sakic", hometown: "Burnaby, CAN", team_id: @team_1.id)
      @player_2 = Player.create!(healthy: true, weight_lbs: 230, name: "Rob Blake", hometown: "Edmonton, CAN" , team_id: @team_1.id)
      @player_3= Player.create!(healthy: false, weight_lbs: 190, name: "Patrick Roy", hometown: "Quebeq City, CAN" , team_id: @team_1.id)

      @player_4 = Player.create!(healthy: true, weight_lbs: 220, name: "Nick Lidstrom", hometown: "Stockholm, SWE", team_id: @team_2.id)
      @player_5 = Player.create!(healthy: true, weight_lbs: 180, name: "Chris Osgood", hometown: "Davos, CH" , team_id: @team_2.id)
      @player_6= Player.create!(healthy: false, weight_lbs: 196, name: "Steve Yzerman", hometown: "Cranbrook, CAN" , team_id: @team_2.id)

      @player_7 = Player.create!(healthy: true, weight_lbs: 215, name: "Brenden Morrow", hometown: "Carlyle, CAN", team_id: @team_3.id)
      @player_8 = Player.create!(healthy: true, weight_lbs: 200, name: "Ed Belfour", hometown: "Carman, CAN" , team_id: @team_3.id)
      @player_9= Player.create!(healthy: false, weight_lbs: 187, name: "Mike Maodano", hometown: "Livonia, USA" , team_id: @team_3.id)
    end

    it 'can sort the teams in  order by created at' do
      expect(Team.order_by_created_first).to eq([@team_1, @team_2, @team_3])
    end

    it 'can sort A-Z the players for a team' do
      expect(@team_1.sort_a_z).to eq([@player_1, @player_3, @player_2])
      expect(@team_2.sort_a_z).to eq([@player_5, @player_4, @player_6])
      expect(@team_3.sort_a_z).to eq([@player_7, @player_8, @player_9])
    end
  end
end
