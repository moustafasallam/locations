# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20171115162739) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "locations", force: :cascade do |t|
    t.string   "city_name",                                     default: ""
    t.integer  "city_id",                                       default: 0
    t.string   "country_code",                                  default: ""
    t.integer  "sunrise",                                       default: 0
    t.integer  "sunset",                                        default: 0
    t.float    "wind_speed",                                    default: 0.0
    t.integer  "wind_degree",                                   default: 0
    t.float    "temperature",                                   default: 0.0
    t.float    "min_temp",                                      default: 0.0
    t.float    "max_temp",                                      default: 0.0
    t.integer  "humidity",                                      default: 0
    t.string   "weather_title",                                 default: ""
    t.string   "weather_description",                           default: ""
    t.decimal  "latitude",            precision: 16, scale: 10
    t.decimal  "longitude",           precision: 16, scale: 10
    t.datetime "created_at",                                                  null: false
    t.datetime "updated_at",                                                  null: false
  end

  add_index "locations", ["city_id"], name: "index_locations_on_city_id", unique: true, using: :btree
  add_index "locations", ["city_name"], name: "index_locations_on_city_name", using: :btree
  add_index "locations", ["country_code"], name: "index_locations_on_country_code", using: :btree

end
