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

ActiveRecord::Schema.define(version: 2019_06_07_114212) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "allowed_interpretations", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "direction"
    t.string "formal_quality"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "area_id"
    t.index ["area_id"], name: "index_allowed_interpretations_on_area_id"
  end

  create_table "areas", force: :cascade do |t|
    t.string "code"
    t.integer "numZones"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "sheet_id"
    t.bigint "allowed_interpretation_id"
    t.index ["allowed_interpretation_id"], name: "index_areas_on_allowed_interpretation_id"
    t.index ["sheet_id"], name: "index_areas_on_sheet_id"
  end

  create_table "areas_zones", id: false, force: :cascade do |t|
    t.bigint "area_id", null: false
    t.bigint "zone_id", null: false
    t.index ["area_id", "zone_id"], name: "index_areas_zones_on_area_id_and_zone_id"
    t.index ["zone_id", "area_id"], name: "index_areas_zones_on_zone_id_and_area_id"
  end

  create_table "interpretations", force: :cascade do |t|
    t.string "direction"
    t.string "formal_quality"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "development_quality"
    t.string "name"
    t.string "description"
    t.bigint "rorschachTest_id"
    t.index ["rorschachTest_id"], name: "index_interpretations_on_rorschachTest_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "given_name"
    t.string "last_name"
    t.string "phone"
    t.integer "age"
    t.boolean "sex"
    t.boolean "isPatient"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "institution"
  end

  create_table "rorschach_tests", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "patient_id"
    t.index ["patient_id"], name: "index_rorschach_tests_on_patient_id"
    t.index ["user_id"], name: "index_rorschach_tests_on_user_id"
  end

  create_table "sheets", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "background"
  end

  create_table "stat_non_pat_adults", force: :cascade do |t|
    t.decimal "mean", precision: 5, scale: 2
    t.decimal "sd", precision: 5, scale: 2
    t.decimal "min", precision: 5, scale: 2
    t.decimal "max", precision: 5, scale: 2
    t.integer "freq"
    t.decimal "median", precision: 5, scale: 2
    t.decimal "mode", precision: 5, scale: 2
    t.decimal "sk", precision: 5, scale: 2
    t.decimal "ku", precision: 5, scale: 2
    t.string "variable"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password", null: false
    t.string "salt", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "given_name"
    t.string "last_name"
    t.string "licence_number"
    t.string "institution"
    t.string "phone"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "zones", force: :cascade do |t|
    t.integer "coord_x"
    t.integer "coord_y"
    t.integer "width"
    t.integer "height"
    t.integer "z_index"
    t.string "bg_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "allowed_interpretations", "areas"
  add_foreign_key "areas", "allowed_interpretations"
end
