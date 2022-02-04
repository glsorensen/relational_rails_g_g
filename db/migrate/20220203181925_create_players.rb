class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.boolean :healthy
      t.integer :weight_lbs
      t.string :name
      t.string :hometown
      t.timestamps
    end
  end
end
