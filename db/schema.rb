# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_02_15_091611) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "craft_beer_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "craft_beers", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "international_bitterness_unit"
    t.decimal "alcohol_volume"
    t.decimal "price"
    t.string "flavor"
    t.string "color"
    t.string "hop"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "craft_beer_type_id"
    t.index ["craft_beer_type_id"], name: "index_craft_beers_on_craft_beer_type_id"
  end

  add_foreign_key "craft_beers", "craft_beer_types"
end
