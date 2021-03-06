# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_05_152904) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bulldog_jobs_parsed_offers", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "raw_datum_id"
    t.jsonb "body"
  end

  create_table "bulldog_jobs_raw_data", force: :cascade do |t|
    t.string "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "just_join_it_parsed_offers", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "raw_datum_id"
    t.jsonb "body"
  end

  create_table "just_join_it_raw_data", force: :cascade do |t|
    t.string "body", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "no_fluff_jobs_parsed_offers", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "raw_datum_id"
    t.jsonb "body"
  end

  create_table "no_fluff_jobs_raw_data", force: :cascade do |t|
    t.string "body", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "offers", force: :cascade do |t|
    t.string "company", null: false
    t.string "title", null: false
    t.string "link", null: false
    t.string "city", null: false
    t.string "salary", null: false
    t.string "job_board", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "stale", default: false, null: false
  end

  add_foreign_key "just_join_it_parsed_offers", "just_join_it_raw_data", column: "raw_datum_id"
end
