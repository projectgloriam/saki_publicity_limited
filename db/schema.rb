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

ActiveRecord::Schema.define(version: 20160909102202) do

  create_table "events", force: :cascade do |t|
    t.string   "event_name"
    t.string   "event_description"
    t.date     "event_date_start"
    t.date     "event_date_end"
    t.time     "event_time_start"
    t.time     "event_time_end"
    t.integer  "organization_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "location_id"
  end

  add_index "events", ["location_id"], name: "index_events_on_location_id"
  add_index "events", ["organization_id"], name: "index_events_on_organization_id"

  create_table "events_staffs", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "staff_id"
    t.string   "staff_qr_code"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.boolean  "checkedin",     default: false
  end

  add_index "events_staffs", ["event_id", "staff_id"], name: "index_events_staffs_on_event_id_and_staff_id"
  add_index "events_staffs", ["event_id"], name: "index_events_staffs_on_event_id"
  add_index "events_staffs", ["staff_id"], name: "index_events_staffs_on_staff_id"

  create_table "locations", force: :cascade do |t|
    t.string   "location_name"
    t.string   "location_description"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "organization_name"
    t.string   "organization_address"
    t.string   "organization_telephone"
    t.string   "organization_email"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "staffs", force: :cascade do |t|
    t.string   "staff_first_name"
    t.string   "staff_last_name"
    t.string   "staff_email"
    t.string   "staff_telephone"
    t.integer  "organization_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "staffs", ["organization_id"], name: "index_staffs_on_organization_id"

end
