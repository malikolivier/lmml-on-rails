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

ActiveRecord::Schema.define(version: 20161222133414) do

  create_table "autopsies", force: :cascade do |t|
    t.boolean  "completed",           default: false
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

  create_table "coronary_arteries", force: :cascade do |t|
    t.integer  "internal_heart_examination_id"
    t.integer  "category",                      null: false
    t.float    "stenosis"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["internal_heart_examination_id"], name: "index_coronary_arteries_on_internal_heart_examination_id"
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
    t.text     "constitution"
    t.text     "livor_mortis_note"
    t.text     "rigor_mortis_note"
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
    t.integer  "coordinate_system", null: false
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
    t.integer  "oesophagus_substance_id"
    t.integer  "larynx_substance_id"
    t.integer  "trachea_substance_id"
    t.integer  "main_bronchi_substance_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["examination_id"], name: "index_internal_neck_organs_examinations_on_examination_id"
    t.index ["larynx_substance_id"], name: "in_larynx_substance"
    t.index ["main_bronchi_substance_id"], name: "in_main_bronchi_substance"
    t.index ["oesophagus_substance_id"], name: "in_oesophagus_substance"
    t.index ["trachea_substance_id"], name: "in_trachea_substance"
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
    t.integer  "on_fingure_pressure"
    t.integer  "external_outline_examination_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["external_outline_examination_id"], name: "index_livores_mortis_on_external_outline_examination_id"
  end

  create_table "mouth_photograph_takings", force: :cascade do |t|
    t.integer  "external_mouth_examination_id", null: false
    t.integer  "photograph_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["external_mouth_examination_id"], name: "mouth_has_photograph"
    t.index ["photograph_id"], name: "index_mouth_photograph_takings_on_photograph_id"
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

  create_table "rigores_mortis", force: :cascade do |t|
    t.integer  "joint",                           null: false
    t.integer  "intensity"
    t.integer  "category"
    t.integer  "external_outline_examination_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["external_outline_examination_id"], name: "index_rigores_mortis_on_external_outline_examination_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "substances", force: :cascade do |t|
    t.text     "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
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

end
