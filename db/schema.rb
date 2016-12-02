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

ActiveRecord::Schema.define(version: 20161202092425) do

  create_table "autopsies", force: :cascade do |t|
    t.boolean  "completed"
    t.text     "number"
    t.text     "conclusion"
    t.integer  "suspect_id"
    t.integer  "victim_id"
    t.integer  "place_id"
    t.date     "autopsy_date"
    t.datetime "starting_time"
    t.datetime "ending_time"
    t.integer  "police_station_id"
    t.integer  "police_inspector_id"
    t.integer  "court_id"
    t.integer  "judge_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "explications", force: :cascade do |t|
    t.text     "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "institutions", force: :cascade do |t|
    t.text     "name"
    t.text     "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.text     "name"
    t.text     "sex"
    t.integer  "age"
    t.text     "title"
    t.integer  "institution_id"
    t.text     "identification_number"
    t.integer  "role_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "photographs", force: :cascade do |t|
    t.integer  "type"
    t.string   "caption"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "roles", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
