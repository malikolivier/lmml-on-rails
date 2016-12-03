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

ActiveRecord::Schema.define(version: 20161203020309) do

  create_table "autopsies", force: :cascade do |t|
    t.boolean  "completed",           default: false
    t.text     "number"
    t.integer  "autopsy_type_id"
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
    t.index ["autopsy_type_id"], name: "index_autopsies_on_autopsy_type_id"
    t.index ["court_id"], name: "index_autopsies_on_court_id"
    t.index ["judge_id"], name: "index_autopsies_on_judge_id"
    t.index ["place_id"], name: "index_autopsies_on_place_id"
    t.index ["police_inspector_id"], name: "index_autopsies_on_police_inspector_id"
    t.index ["police_station_id"], name: "index_autopsies_on_police_station_id"
    t.index ["suspect_id"], name: "index_autopsies_on_suspect_id"
    t.index ["victim_id"], name: "index_autopsies_on_victim_id"
  end

  create_table "autopsy_photograph_takings", force: :cascade do |t|
    t.integer  "category"
    t.integer  "autopsy_id"
    t.integer  "photograph_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["autopsy_id"], name: "index_autopsy_photograph_takings_on_autopsy_id"
    t.index ["photograph_id"], name: "index_autopsy_photograph_takings_on_photograph_id"
  end

  create_table "autopsy_types", force: :cascade do |t|
    t.text     "name",       null: false
    t.text     "law"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "body_areas", force: :cascade do |t|
    t.integer  "body_reference_id",      null: false
    t.integer  "in_body_orientation_id"
    t.float    "distance"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["body_reference_id"], name: "index_body_areas_on_body_reference_id"
    t.index ["in_body_orientation_id"], name: "index_body_areas_on_in_body_orientation_id"
  end

  create_table "body_references", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conclusions", force: :cascade do |t|
    t.text     "content"
    t.integer  "autopsy_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["autopsy_id"], name: "index_conclusions_on_autopsy_id"
  end

  create_table "examination_types", force: :cascade do |t|
    t.integer  "category",   null: false
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "examinations", force: :cascade do |t|
    t.text     "note"
    t.integer  "autopsy_id",          null: false
    t.integer  "examination_type_id", null: false
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["autopsy_id"], name: "index_examinations_on_autopsy_id"
    t.index ["examination_type_id"], name: "index_examinations_on_examination_type_id"
  end

  create_table "explanations", force: :cascade do |t|
    t.text     "title"
    t.text     "content"
    t.integer  "autopsy_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["autopsy_id"], name: "index_explanations_on_autopsy_id"
  end

  create_table "external_outline_examinations", force: :cascade do |t|
    t.integer  "sex"
    t.float    "height"
    t.float    "weight"
    t.boolean  "partial_body"
    t.string   "constitution"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "in_body_orientations", force: :cascade do |t|
    t.integer  "coordinate_system", null: false
    t.float    "x"
    t.float    "y"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "injuries", force: :cascade do |t|
    t.integer  "examination_id"
    t.text     "description"
    t.integer  "body_area_id"
    t.integer  "injury_size_id"
    t.integer  "injury_depth_id"
    t.integer  "injury_type"
    t.integer  "time_sustained"
    t.integer  "parent_injury_id"
    t.text     "note"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["body_area_id"], name: "index_injuries_on_body_area_id"
    t.index ["examination_id"], name: "index_injuries_on_examination_id"
    t.index ["injury_depth_id"], name: "index_injuries_on_injury_depth_id"
    t.index ["injury_size_id"], name: "index_injuries_on_injury_size_id"
    t.index ["injury_type"], name: "index_injuries_on_injury_type"
    t.index ["parent_injury_id"], name: "index_injuries_on_parent_injury_id"
  end

  create_table "injury_depths", force: :cascade do |t|
    t.float    "depth"
    t.integer  "reached_organ_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["reached_organ_id"], name: "index_injury_depths_on_reached_organ_id"
  end

  create_table "injury_photograph_takings", force: :cascade do |t|
    t.integer  "injury_id"
    t.integer  "photograph_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["injury_id"], name: "index_injury_photograph_takings_on_injury_id"
    t.index ["photograph_id"], name: "index_injury_photograph_takings_on_photograph_id"
  end

  create_table "injury_sizes", force: :cascade do |t|
    t.integer  "shape"
    t.float    "length"
    t.float    "width"
    t.integer  "in_body_orientation_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["in_body_orientation_id"], name: "index_injury_sizes_on_in_body_orientation_id"
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

  create_table "livores_mortis", force: :cascade do |t|
    t.integer  "color"
    t.integer  "position"
    t.integer  "intensity"
    t.integer  "on_fingure_pressure"
    t.integer  "external_outline_examination_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["external_outline_examination_id"], name: "index_livores_mortis_on_external_outline_examination_id"
  end

  create_table "organ_examinations", force: :cascade do |t|
    t.integer  "organ_id"
    t.integer  "examination_type_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["examination_type_id"], name: "index_organ_examinations_on_examination_type_id"
    t.index ["organ_id"], name: "index_organ_examinations_on_organ_id"
  end

  create_table "organs", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.text     "caption"
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

end
