# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_02_04_135141) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dives", force: :cascade do |t|
    t.string "title"
    t.boolean "beginner"
    t.integer "max_depth"
    t.string "current_strength"
    t.string "charter_loc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "location_id"
    t.index ["location_id"], name: "index_dives_on_location_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "title", null: false
    t.boolean "has_reefs"
    t.integer "num_of_species"
    t.string "peak_season"
    t.string "region"
    t.string "water_temp"
    t.string "description"
  end

  create_table "players", force: :cascade do |t|
    t.boolean "healthy"
    t.integer "weight_lbs"
    t.string "name"
    t.string "hometown"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "team_id"
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.boolean "in_playoffs"
    t.integer "total_wins"
    t.string "name"
    t.string "city"
    t.string "home_arena"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "dives", "locations"
  add_foreign_key "players", "teams"
end
