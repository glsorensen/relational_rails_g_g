class CreateDives < ActiveRecord::Migration[5.2]
  def change
    create_table :dives do |t|
      t.string :title
      t.integer :location_id
      t.boolean :beginner
      t.integer :max_depth
      t.string :current_strength
      t.string :charter_loc
      t.timestamps
    end
  end
end
