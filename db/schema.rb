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

ActiveRecord::Schema.define(version: 20161202122734) do

  create_table "autopsies", force: :cascade do |t|
    t.boolean  "completed",           default: false
    t.text     "number"
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["court_id"], name: "index_autopsies_on_court_id"
    t.index ["judge_id"], name: "index_autopsies_on_judge_id"
    t.index ["place_id"], name: "index_autopsies_on_place_id"
    t.index ["police_inspector_id"], name: "index_autopsies_on_police_inspector_id"
    t.index ["police_station_id"], name: "index_autopsies_on_police_station_id"
    t.index ["suspect_id"], name: "index_autopsies_on_suspect_id"
    t.index ["victim_id"], name: "index_autopsies_on_victim_id"
  end

  create_table "conclusions", force: :cascade do |t|
    t.text     "content"
    t.integer  "autopsy_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["autopsy_id"], name: "index_conclusions_on_autopsy_id"
  end

  create_table "drugs", force: :cascade do |t|
    t.text     "name"
    t.text     "abbr"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "explanations", force: :cascade do |t|
    t.text     "title"
    t.text     "content"
    t.integer  "autopsy_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["autopsy_id"], name: "index_explanations_on_autopsy_id"
  end

  create_table "institution_types", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "institutions", force: :cascade do |t|
    t.text     "name"
    t.text     "address"
    t.integer  "institution_type_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["institution_type_id"], name: "index_institutions_on_institution_type_id"
  end

  create_table "participations", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "autopsy_id"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["autopsy_id"], name: "index_participations_on_autopsy_id"
    t.index ["person_id"], name: "index_participations_on_person_id"
    t.index ["role_id"], name: "index_participations_on_role_id"
  end

  create_table "people", force: :cascade do |t|
    t.text     "name"
    t.integer  "sex"
    t.integer  "age"
    t.text     "title"
    t.integer  "institution_id"
    t.text     "identification_number"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["institution_id"], name: "index_people_on_institution_id"
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
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "test_blood_type_experiments", force: :cascade do |t|
    t.text     "serum"
    t.text     "reaction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "test_blood_types", force: :cascade do |t|
    t.text     "result"
    t.text     "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "test_histopathologies", force: :cascade do |t|
    t.text     "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "test_histopathology_organs", force: :cascade do |t|
    t.integer  "test_histopathology_id"
    t.integer  "organ_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "test_triage_drugs", force: :cascade do |t|
    t.float    "concentration"
    t.integer  "reaction"
    t.text     "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "test_triages", force: :cascade do |t|
    t.string   "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
