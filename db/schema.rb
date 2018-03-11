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

ActiveRecord::Schema.define(version: 20180311010153) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "category_achievements", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.bigint "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region_id"], name: "index_cities_on_region_id"
  end

  create_table "continents", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "greatest_lat"
    t.integer "least_lat"
    t.integer "greatest_lng"
    t.integer "least_lng"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.bigint "continent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["continent_id"], name: "index_countries_on_continent_id"
  end

  create_table "districts", force: :cascade do |t|
    t.string "name"
    t.bigint "neighbourhood_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["neighbourhood_id"], name: "index_districts_on_neighbourhood_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "latitude"
    t.string "longitude"
    t.string "category"
    t.bigint "district_id"
    t.bigint "category_achievement_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_achievement_id"], name: "index_locations_on_category_achievement_id"
    t.index ["district_id"], name: "index_locations_on_district_id"
  end

  create_table "neighbourhoods", force: :cascade do |t|
    t.string "name"
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_neighbourhoods_on_city_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.bigint "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_regions_on_country_id"
  end

  create_table "user_locations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_user_locations_on_location_id"
    t.index ["user_id"], name: "index_user_locations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cities", "regions"
  add_foreign_key "countries", "continents"
  add_foreign_key "districts", "neighbourhoods"
  add_foreign_key "locations", "category_achievements"
  add_foreign_key "locations", "districts"
  add_foreign_key "neighbourhoods", "cities"
  add_foreign_key "regions", "countries"
  add_foreign_key "user_locations", "locations"
  add_foreign_key "user_locations", "users"
end
