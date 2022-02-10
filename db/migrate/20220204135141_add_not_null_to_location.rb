class AddNotNullToLocation < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:locations, :title, false)
  end
end
