require 'date'
class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :title
      t.boolean :has_reefs
      t.integer :num_of_species
      t.string :peak_season
      t.string :region
      t.string :water_temp
      t.timestamps
    end
  end
end
