class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.boolean :in_playoffs
      t.integer :total_wins
      t.string :name
      t.string :city
      t.string :home_arena

      t.timestamps
    end
  end
end
