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

ActiveRecord::Schema.define(version: 2019_09_08_130602) do

  create_table "readings", force: :cascade do |t|
    t.integer "thermostat_id"
    t.integer "tracking_number"
    t.float "temperature"
    t.float "humidity"
    t.float "battery_charge"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["thermostat_id", "tracking_number"], name: "index_readings_on_thermostat_id_and_tracking_number", unique: true
    t.index ["thermostat_id"], name: "index_readings_on_thermostat_id"
    t.index ["tracking_number"], name: "index_readings_on_tracking_number"
  end

  create_table "thermostats", force: :cascade do |t|
    t.string "household_token"
    t.text "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["household_token"], name: "index_thermostats_on_household_token"
  end

end
