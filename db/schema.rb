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

ActiveRecord::Schema.define(version: 20170421063619) do

  create_table "analyses", force: :cascade do |t|
    t.boolean  "completed"
    t.text     "note"
    t.integer  "autopsy_id",       null: false
    t.integer  "analysis_type_id", null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["analysis_type_id"], name: "index_analyses_on_analysis_type_id"
    t.index ["autopsy_id"], name: "index_analyses_on_autopsy_id"
  end

  create_table "analysis_biochemistries", force: :cascade do |t|
    t.integer  "analysis_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["analysis_id"], name: "index_analysis_biochemistries_on_analysis_id"
  end

  create_table "analysis_blood_types", force: :cascade do |t|
    t.integer  "analysis_id"
    t.integer  "anti_a"
    t.integer  "anti_b"
    t.integer  "anti_h"
    t.integer  "blood_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["analysis_id"], name: "index_analysis_blood_types_on_analysis_id"
  end

  create_table "analysis_carbon_monoxides", force: :cascade do |t|
    t.integer  "analysis_id"
    t.float    "left_heart_saturation"
    t.float    "right_heart_saturation"
    t.float    "iliac_vein_saturation"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["analysis_id"], name: "index_analysis_carbon_monoxides_on_analysis_id"
  end

  create_table "analysis_diatom_tests", force: :cascade do |t|
    t.integer  "analysis_id"
    t.integer  "conclusion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["analysis_id"], name: "index_analysis_diatom_tests_on_analysis_id"
  end

  create_table "analysis_ethanols", force: :cascade do |t|
    t.integer  "analysis_id"
    t.integer  "contract_institution_id"
    t.boolean  "found",                    null: false
    t.date     "date"
    t.float    "heart_concentration"
    t.float    "iliac_vein_concentration"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["analysis_id"], name: "index_analysis_ethanols_on_analysis_id"
    t.index ["contract_institution_id"], name: "index_analysis_ethanols_on_contract_institution_id"
  end

  create_table "analysis_histopathologies", force: :cascade do |t|
    t.integer  "analysis_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["analysis_id"], name: "index_analysis_histopathologies_on_analysis_id"
  end

  create_table "analysis_histopathology_on_organs", force: :cascade do |t|
    t.integer  "organ_id"
    t.integer  "analysis_histopathology_id", null: false
    t.text     "result"
    t.text     "other_organ"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["analysis_histopathology_id"], name: "organ_histopathology_analysis"
    t.index ["organ_id"], name: "index_analysis_histopathology_on_organs_on_organ_id"
  end

  create_table "analysis_instant_views", force: :cascade do |t|
    t.integer  "analysis_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["analysis_id"], name: "index_analysis_instant_views_on_analysis_id"
  end

  create_table "analysis_others", force: :cascade do |t|
    t.integer  "autopsy_id"
    t.text     "title"
    t.text     "content"
    t.integer  "placement"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["autopsy_id"], name: "index_analysis_others_on_autopsy_id"
  end

  create_table "analysis_poisonings", force: :cascade do |t|
    t.integer  "analysis_id"
    t.integer  "contract_institution_id"
    t.date     "date"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["analysis_id"], name: "index_analysis_poisonings_on_analysis_id"
    t.index ["contract_institution_id"], name: "index_analysis_poisonings_on_contract_institution_id"
  end

  create_table "analysis_triages", force: :cascade do |t|
    t.integer  "analysis_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["analysis_id"], name: "index_analysis_triages_on_analysis_id"
  end

  create_table "analysis_types", force: :cascade do |t|
    t.integer  "placement",  null: false
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "analysis_uropapers", force: :cascade do |t|
    t.integer  "analysis_id"
    t.float    "ph"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "autopsies", force: :cascade do |t|
    t.boolean  "completed",           default: false
    t.boolean  "approved",            default: false
    t.text     "number"
    t.integer  "autopsy_type_id"
    t.integer  "examiner_id"
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
    t.index ["examiner_id"], name: "index_autopsies_on_examiner_id"
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

  create_table "biochemical_analyses", force: :cascade do |t|
    t.integer  "analysis_biochemistry_id"
    t.integer  "contract_institution_id"
    t.integer  "biochemical_analysis_type_id"
    t.date     "date"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["analysis_biochemistry_id"], name: "index_biochemical_analyses_on_analysis_biochemistry_id"
    t.index ["biochemical_analysis_type_id"], name: "index_biochemical_analyses_on_biochemical_analysis_type_id"
    t.index ["contract_institution_id"], name: "index_biochemical_analyses_on_contract_institution_id"
  end

  create_table "biochemical_analysis_results", force: :cascade do |t|
    t.integer  "biochemical_analysis_id"
    t.integer  "molecule_id"
    t.float    "quantity"
    t.boolean  "approximate",             default: false
    t.integer  "unit"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.index ["biochemical_analysis_id"], name: "index_biochemical_analysis_results_on_biochemical_analysis_id"
    t.index ["molecule_id"], name: "index_biochemical_analysis_results_on_molecule_id"
  end

  create_table "biochemical_analysis_type_translations", force: :cascade do |t|
    t.integer  "biochemical_analysis_type_id", null: false
    t.string   "locale",                       null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.text     "title"
    t.text     "experiment_description"
    t.index ["biochemical_analysis_type_id"], name: "index_fb94f1ebb13662f8158b5460c1ab4f68885e0217"
    t.index ["locale"], name: "index_biochemical_analysis_type_translations_on_locale"
  end

  create_table "biochemical_analysis_types", force: :cascade do |t|
    t.integer  "placement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "body_areas", force: :cascade do |t|
    t.integer  "body_reference_id"
    t.integer  "in_body_orientation_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["body_reference_id"], name: "index_body_areas_on_body_reference_id"
    t.index ["in_body_orientation_id"], name: "index_body_areas_on_in_body_orientation_id"
  end

  create_table "body_reference_translations", force: :cascade do |t|
    t.integer  "body_reference_id", null: false
    t.string   "locale",            null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.text     "name"
    t.text     "description"
    t.index ["body_reference_id"], name: "index_body_reference_translations_on_body_reference_id"
    t.index ["locale"], name: "index_body_reference_translations_on_locale"
  end

  create_table "body_references", force: :cascade do |t|
    t.integer  "position"
    t.integer  "deixis"
    t.text     "abbr"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chemical_analysis_method_translations", force: :cascade do |t|
    t.integer  "chemical_analysis_method_id", null: false
    t.string   "locale",                      null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.text     "name"
    t.index ["chemical_analysis_method_id"], name: "index_ab07b522caba59c135c9940ed98b90c1e020b085"
    t.index ["locale"], name: "index_chemical_analysis_method_translations_on_locale"
  end

  create_table "chemical_analysis_methods", force: :cascade do |t|
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

  create_table "coronary_arteries", force: :cascade do |t|
    t.integer  "internal_heart_examination_id"
    t.integer  "category",                      null: false
    t.float    "stenosis"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["internal_heart_examination_id"], name: "index_coronary_arteries_on_internal_heart_examination_id"
  end

  create_table "diatom_counts", force: :cascade do |t|
    t.integer  "analysis_diatom_test_id"
    t.integer  "category"
    t.integer  "quantity"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["analysis_diatom_test_id"], name: "index_diatom_counts_on_analysis_diatom_test_id"
  end

  create_table "drug_translations", force: :cascade do |t|
    t.integer  "drug_id",    null: false
    t.string   "locale",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "name"
    t.text     "long_name"
    t.index ["drug_id"], name: "index_drug_translations_on_drug_id"
    t.index ["locale"], name: "index_drug_translations_on_locale"
  end

  create_table "drugs", force: :cascade do |t|
    t.text     "abbr"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "examination_types", force: :cascade do |t|
    t.integer  "category",    null: false
    t.integer  "placement",   null: false
    t.integer  "subdivision"
    t.text     "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "examinations", force: :cascade do |t|
    t.boolean  "completed",           default: false
    t.text     "note"
    t.integer  "autopsy_id",                          null: false
    t.integer  "examination_type_id",                 null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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

  create_table "external_anus_examinations", force: :cascade do |t|
    t.integer  "examination_id"
    t.integer  "closed"
    t.integer  "feces_quantity"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["examination_id"], name: "index_external_anus_examinations_on_examination_id"
  end

  create_table "external_back_examinations", force: :cascade do |t|
    t.integer  "examination_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["examination_id"], name: "index_external_back_examinations_on_examination_id"
  end

  create_table "external_ear_examinations", force: :cascade do |t|
    t.integer  "deixis",                                       null: false
    t.boolean  "bleeding",                     default: false
    t.integer  "injury_id"
    t.integer  "external_head_examination_id",                 null: false
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.index ["external_head_examination_id"], name: "ear"
    t.index ["injury_id"], name: "index_external_ear_examinations_on_injury_id"
  end

  create_table "external_eye_examinations", force: :cascade do |t|
    t.integer  "external_face_examination_id", null: false
    t.integer  "deixis",                       null: false
    t.integer  "closed"
    t.float    "aperture"
    t.integer  "eyelid_congestion"
    t.integer  "eyelid_petechia"
    t.text     "eyelid_note"
    t.integer  "conjunctiva_congestion"
    t.integer  "conjunctiva_petechia"
    t.text     "conjunctiva_note"
    t.text     "cornea"
    t.text     "pupil"
    t.float    "diameter"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["external_face_examination_id"], name: "eye_on_face"
  end

  create_table "external_face_examinations", force: :cascade do |t|
    t.integer  "examination_id"
    t.integer  "congestion"
    t.integer  "swelling"
    t.text     "nasal_cavity_content"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["examination_id"], name: "index_external_face_examinations_on_examination_id"
  end

  create_table "external_genitalia_examinations", force: :cascade do |t|
    t.integer  "examination_id"
    t.integer  "hair_color"
    t.float    "hair_length"
    t.integer  "sex"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["examination_id"], name: "index_external_genitalia_examinations_on_examination_id"
  end

  create_table "external_head_examinations", force: :cascade do |t|
    t.integer  "examination_id"
    t.integer  "hair_natural_color"
    t.integer  "hair_dyed_color"
    t.float    "top_hair_length"
    t.float    "side_hair_length"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["examination_id"], name: "index_external_head_examinations_on_examination_id"
  end

  create_table "external_lower_limbs_examinations", force: :cascade do |t|
    t.integer  "examination_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["examination_id"], name: "index_external_lower_limbs_examinations_on_examination_id"
  end

  create_table "external_mouth_examinations", force: :cascade do |t|
    t.integer  "closed"
    t.float    "aperture"
    t.integer  "petechia"
    t.integer  "tongue_tip"
    t.float    "tongue_tip_distance"
    t.text     "note"
    t.integer  "external_face_examination_id", null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["external_face_examination_id"], name: "face"
  end

  create_table "external_neck_examinations", force: :cascade do |t|
    t.integer  "examination_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["examination_id"], name: "index_external_neck_examinations_on_examination_id"
  end

  create_table "external_outline_examinations", force: :cascade do |t|
    t.integer  "examination_id"
    t.integer  "sex"
    t.float    "height"
    t.float    "weight"
    t.boolean  "partial_body",       default: false
    t.integer  "constitution"
    t.text     "livor_mortis_note"
    t.text     "rigor_mortis_note"
    t.boolean  "cold"
    t.float    "rectal_temperature"
    t.float    "room_temperature"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["examination_id"], name: "index_external_outline_examinations_on_examination_id"
  end

  create_table "external_trunk_examinations", force: :cascade do |t|
    t.integer  "examination_id"
    t.integer  "abdominal_discoloration"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["examination_id"], name: "index_external_trunk_examinations_on_examination_id"
  end

  create_table "external_upper_limbs_examinations", force: :cascade do |t|
    t.integer  "examination_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["examination_id"], name: "index_external_upper_limbs_examinations_on_examination_id"
  end

  create_table "foreign_fluids", force: :cascade do |t|
    t.integer  "color"
    t.text     "name"
    t.text     "description"
    t.integer  "odor"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "found_poisons", force: :cascade do |t|
    t.integer  "analysis_poisoning_id"
    t.integer  "drug_id"
    t.integer  "chemical_analysis_method_id"
    t.integer  "unit"
    t.float    "quantitative_concentration"
    t.integer  "qualitative_concentration"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["analysis_poisoning_id"], name: "index_found_poisons_on_analysis_poisoning_id"
    t.index ["chemical_analysis_method_id"], name: "index_found_poisons_on_chemical_analysis_method_id"
    t.index ["drug_id"], name: "index_found_poisons_on_drug_id"
  end

  create_table "from_reference_reachable_organs", force: :cascade do |t|
    t.integer  "body_reference_id"
    t.integer  "organ_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["body_reference_id"], name: "index_from_reference_reachable_organs_on_body_reference_id"
    t.index ["organ_id"], name: "index_from_reference_reachable_organs_on_organ_id"
  end

  create_table "gall_bladders", force: :cascade do |t|
    t.integer  "internal_liver_examination_id"
    t.integer  "bile_color"
    t.integer  "bile_quantity"
    t.integer  "gallstones_quantity"
    t.integer  "gallstones_color"
    t.integer  "gallstones_size"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["internal_liver_examination_id"], name: "index_gall_bladders_on_internal_liver_examination_id"
  end

  create_table "heart_chambers", force: :cascade do |t|
    t.integer  "internal_heart_examination_id"
    t.integer  "category",                      null: false
    t.integer  "size"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["internal_heart_examination_id"], name: "index_heart_chambers_on_internal_heart_examination_id"
  end

  create_table "in_body_orientations", force: :cascade do |t|
    t.integer  "coordinate_system"
    t.float    "x"
    t.float    "y"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "in_lung_foreign_fluids", force: :cascade do |t|
    t.integer  "internal_lungs_examination_id", null: false
    t.integer  "foreign_fluid_id",              null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["foreign_fluid_id"], name: "index_in_lung_foreign_fluids_on_foreign_fluid_id"
    t.index ["internal_lungs_examination_id"], name: "fluids_in_lung"
  end

  create_table "in_mouth_foreign_fluids", force: :cascade do |t|
    t.integer  "external_mouth_examination_id"
    t.integer  "foreign_fluid_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["external_mouth_examination_id"], name: "index_in_mouth_foreign_fluids_on_external_mouth_examination_id"
    t.index ["foreign_fluid_id"], name: "index_in_mouth_foreign_fluids_on_foreign_fluid_id"
  end

  create_table "in_peritoneum_foreign_fluids", force: :cascade do |t|
    t.integer  "internal_abdominal_wall_examination_id", null: false
    t.integer  "foreign_fluid_id",                       null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["foreign_fluid_id"], name: "index_in_peritoneum_foreign_fluids_on_foreign_fluid_id"
    t.index ["internal_abdominal_wall_examination_id"], name: "fluids_in_peritoneum"
  end

  create_table "in_pleura_foreign_fluids", force: :cascade do |t|
    t.integer  "internal_abdominal_wall_examination_id", null: false
    t.integer  "foreign_fluid_id",                       null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["foreign_fluid_id"], name: "index_in_pleura_foreign_fluids_on_foreign_fluid_id"
    t.index ["internal_abdominal_wall_examination_id"], name: "fluids_in_pleura"
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
    t.integer  "coordinate_system"
    t.float    "angle"
    t.integer  "tohoku_ryu_size"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "instant_view_drug_results", force: :cascade do |t|
    t.integer  "analysis_instant_view_id"
    t.integer  "drug_id"
    t.integer  "result"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["analysis_instant_view_id"], name: "index_instant_view_drug_results_on_analysis_instant_view_id"
    t.index ["drug_id"], name: "index_instant_view_drug_results_on_drug_id"
  end

  create_table "institution_types", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "institutions", force: :cascade do |t|
    t.text     "name"
    t.text     "address"
    t.text     "autopsy_room"
    t.integer  "autopsies_places_count",          default: 0
    t.integer  "autopsies_police_stations_count", default: 0
    t.integer  "autopsies_courts_count",          default: 0
    t.integer  "institution_type_id"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.index ["institution_type_id"], name: "index_institutions_on_institution_type_id"
  end

  create_table "internal_abdominal_aorta_examinations", force: :cascade do |t|
    t.integer  "examination_id"
    t.integer  "arteriosclerosis"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["examination_id"], name: "index_internal_abdominal_aorta_examinations_on_examination_id"
  end

  create_table "internal_abdominal_wall_examinations", force: :cascade do |t|
    t.integer  "examination_id"
    t.integer  "subcutaneous_fat_level"
    t.float    "subcutaneous_fat_thickness"
    t.float    "diaphragm_height_left"
    t.float    "diaphragm_height_right"
    t.integer  "pleura_adhesion"
    t.integer  "air_in_digestive_track"
    t.integer  "peritoneum_adhesion"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["examination_id"], name: "index_internal_abdominal_wall_examinations_on_examination_id"
  end

  create_table "internal_adrenal_glands_examinations", force: :cascade do |t|
    t.integer  "examination_id"
    t.integer  "deixis"
    t.integer  "cortex_thickness"
    t.integer  "medulla_thickness"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["examination_id"], name: "index_internal_adrenal_glands_examinations_on_examination_id"
  end

  create_table "internal_back_examinations", force: :cascade do |t|
    t.integer  "examination_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["examination_id"], name: "index_internal_back_examinations_on_examination_id"
  end

  create_table "internal_bladder_examinations", force: :cascade do |t|
    t.integer  "examination_id"
    t.integer  "urine_color"
    t.float    "urine_quantity"
    t.integer  "urine_transparency"
    t.integer  "membrane_color"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["examination_id"], name: "index_internal_bladder_examinations_on_examination_id"
  end

  create_table "internal_brain_examinations", force: :cascade do |t|
    t.integer  "examination_id"
    t.float    "weight"
    t.integer  "pia_congestion"
    t.integer  "blood_spots"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["examination_id"], name: "index_internal_brain_examinations_on_examination_id"
  end

  create_table "internal_cranium_examinations", force: :cascade do |t|
    t.integer  "examination_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["examination_id"], name: "index_internal_cranium_examinations_on_examination_id"
  end

  create_table "internal_genitalia_examinations", force: :cascade do |t|
    t.integer  "examination_id"
    t.float    "length"
    t.float    "fundal_width"
    t.float    "cervical_width"
    t.integer  "endometrium_color"
    t.integer  "ovaries_presence"
    t.float    "ovaries_distance"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["examination_id"], name: "index_internal_genitalia_examinations_on_examination_id"
  end

  create_table "internal_heart_examinations", force: :cascade do |t|
    t.integer  "examination_id"
    t.float    "weight"
    t.integer  "rigor_mortis"
    t.integer  "epicardial_lipomatosis"
    t.integer  "epicardial_petechia"
    t.float    "extracted_blood_quantity"
    t.integer  "extracted_blood_color"
    t.integer  "extracted_blood_coagulation"
    t.float    "thickness_left"
    t.float    "thickness_right"
    t.integer  "scar_left"
    t.integer  "scar_right"
    t.float    "pulmonary_artery_width"
    t.integer  "pulmonary_artery_thrombus"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["examination_id"], name: "index_internal_heart_examinations_on_examination_id"
  end

  create_table "internal_intestines_examinations", force: :cascade do |t|
    t.integer  "examination_id"
    t.integer  "appendix"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["examination_id"], name: "index_internal_intestines_examinations_on_examination_id"
  end

  create_table "internal_kidneys_examinations", force: :cascade do |t|
    t.integer  "examination_id"
    t.integer  "deixis",             null: false
    t.float    "weight"
    t.integer  "hardness"
    t.integer  "capsule_removal"
    t.integer  "capsule_congestion"
    t.integer  "pelvis_congestion"
    t.integer  "pelvis_petechia"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["examination_id"], name: "index_internal_kidneys_examinations_on_examination_id"
  end

  create_table "internal_liver_examinations", force: :cascade do |t|
    t.integer  "examination_id"
    t.float    "weight"
    t.integer  "hardness"
    t.integer  "congestion"
    t.integer  "steatosis"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "internal_lungs_examinations", force: :cascade do |t|
    t.integer  "examination_id"
    t.integer  "deixis",         null: false
    t.float    "weight"
    t.integer  "air_content"
    t.integer  "congestion"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["examination_id"], name: "index_internal_lungs_examinations_on_examination_id"
  end

  create_table "internal_neck_organs_examinations", force: :cascade do |t|
    t.integer  "examination_id"
    t.integer  "lymph_level"
    t.integer  "oesophagus_substance"
    t.integer  "oesophagus_substance_quantity"
    t.integer  "larynx_substance"
    t.integer  "larynx_substance_quantity"
    t.integer  "trachea_substance"
    t.integer  "trachea_substance_quantity"
    t.integer  "main_bronchi_substance"
    t.integer  "main_bronchi_substance_quantity"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["examination_id"], name: "index_internal_neck_organs_examinations_on_examination_id"
  end

  create_table "internal_pancreas_examinations", force: :cascade do |t|
    t.integer  "examination_id"
    t.integer  "hardness"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["examination_id"], name: "index_internal_pancreas_examinations_on_examination_id"
  end

  create_table "internal_pericardium_examinations", force: :cascade do |t|
    t.integer  "examination_id"
    t.integer  "congestion"
    t.integer  "petechia"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["examination_id"], name: "index_internal_pericardium_examinations_on_examination_id"
  end

  create_table "internal_spleen_examinations", force: :cascade do |t|
    t.integer  "examination_id"
    t.float    "weight"
    t.integer  "hardness"
    t.integer  "congestion"
    t.integer  "pulp_distinct"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["examination_id"], name: "index_internal_spleen_examinations_on_examination_id"
  end

  create_table "internal_stomach_examinations", force: :cascade do |t|
    t.integer  "examination_id"
    t.integer  "content_color"
    t.integer  "content_smell"
    t.integer  "content_aspect"
    t.float    "content_quantity"
    t.integer  "content_digestion"
    t.integer  "rugae"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["examination_id"], name: "index_internal_stomach_examinations_on_examination_id"
  end

  create_table "internal_thoracic_aorta_examinations", force: :cascade do |t|
    t.integer  "examination_id"
    t.float    "width"
    t.integer  "arteriosclerosis"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["examination_id"], name: "index_internal_thoracic_aorta_examinations_on_examination_id"
  end

  create_table "intestine_sections", force: :cascade do |t|
    t.integer  "internal_intestines_examination_id"
    t.integer  "category",                           null: false
    t.integer  "color"
    t.integer  "quantity"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["internal_intestines_examination_id"], name: "index_intestine_sections_on_internal_intestines_examination_id"
  end

  create_table "livores_mortis", force: :cascade do |t|
    t.integer  "color"
    t.integer  "position"
    t.integer  "intensity"
    t.integer  "on_finger_pressure"
    t.integer  "external_outline_examination_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["external_outline_examination_id"], name: "index_livores_mortis_on_external_outline_examination_id"
  end

  create_table "molecule_translations", force: :cascade do |t|
    t.integer  "molecule_id", null: false
    t.string   "locale",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "name"
    t.index ["locale"], name: "index_molecule_translations_on_locale"
    t.index ["molecule_id"], name: "index_molecule_translations_on_molecule_id"
  end

  create_table "molecules", force: :cascade do |t|
    t.float    "standard_quantity_min"
    t.float    "standard_quantity_max"
    t.integer  "unit"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "mouth_photograph_takings", force: :cascade do |t|
    t.integer  "external_mouth_examination_id", null: false
    t.integer  "photograph_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["external_mouth_examination_id"], name: "mouth_has_photograph"
    t.index ["photograph_id"], name: "index_mouth_photograph_takings_on_photograph_id"
  end

  create_table "organ_body_references", force: :cascade do |t|
    t.integer  "organ_id"
    t.integer  "body_reference_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["body_reference_id"], name: "index_organ_body_references_on_body_reference_id"
    t.index ["organ_id"], name: "index_organ_body_references_on_organ_id"
  end

  create_table "organ_examinations", force: :cascade do |t|
    t.integer  "organ_id"
    t.integer  "examination_type_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["examination_type_id"], name: "index_organ_examinations_on_examination_type_id"
    t.index ["organ_id"], name: "index_organ_examinations_on_organ_id"
  end

  create_table "organ_translations", force: :cascade do |t|
    t.integer  "organ_id",   null: false
    t.string   "locale",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "name"
    t.index ["locale"], name: "index_organ_translations_on_locale"
    t.index ["organ_id"], name: "index_organ_translations_on_organ_id"
  end

  create_table "organs", force: :cascade do |t|
    t.boolean  "subject_to_histopathology_analysis", default: false
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  create_table "participations", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "autopsy_id"
    t.integer  "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["autopsy_id"], name: "index_participations_on_autopsy_id"
    t.index ["person_id"], name: "index_participations_on_person_id"
    t.index ["role"], name: "index_participations_on_role"
  end

  create_table "people", force: :cascade do |t|
    t.text     "name"
    t.integer  "sex"
    t.integer  "death_age"
    t.date     "dob"
    t.text     "title"
    t.text     "affiliation"
    t.integer  "institution_id"
    t.text     "identification_number"
    t.integer  "autopsies_examiners_count",         default: 0
    t.integer  "autopsies_suspects_count",          default: 0
    t.integer  "autopsies_victims_count",           default: 0
    t.integer  "autopsies_police_inspectors_count", default: 0
    t.integer  "autopsies_judges_count",            default: 0
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
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

  create_table "rigores_mortis", force: :cascade do |t|
    t.integer  "joint",                           null: false
    t.integer  "intensity"
    t.integer  "category"
    t.integer  "external_outline_examination_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["external_outline_examination_id"], name: "index_rigores_mortis_on_external_outline_examination_id"
  end

  create_table "tooth_examinations", force: :cascade do |t|
    t.integer  "external_mouth_examination_id",             null: false
    t.integer  "position",                                  null: false
    t.integer  "rank",                                      null: false
    t.integer  "condition",                     default: 0
    t.text     "note"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.index ["external_mouth_examination_id"], name: "index_tooth_examinations_on_external_mouth_examination_id"
  end

  create_table "triage_drug_results", force: :cascade do |t|
    t.integer  "analysis_triage_id"
    t.integer  "drug_id"
    t.integer  "result"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["analysis_triage_id"], name: "index_triage_drug_results_on_analysis_triage_id"
    t.index ["drug_id"], name: "index_triage_drug_results_on_drug_id"
  end

  create_table "triage_supported_drugs", force: :cascade do |t|
    t.integer  "drug_id"
    t.float    "concentration_threshold"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["drug_id"], name: "index_triage_supported_drugs_on_drug_id"
  end

  create_table "uropaper_results", force: :cascade do |t|
    t.integer  "analysis_uropaper_id"
    t.integer  "category",             null: false
    t.integer  "result"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["analysis_uropaper_id"], name: "index_uropaper_results_on_analysis_uropaper_id"
  end

end
