class AddLocationsToDives < ActiveRecord::Migration[5.2]
  def change
    add_reference :dives, :location, foreign_key: true
  end
end
