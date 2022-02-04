class RemoveLocationIdFromDives < ActiveRecord::Migration[5.2]
  def change
    remove_column :dives, :location_id, :integer
  end
end
