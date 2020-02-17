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

ActiveRecord::Schema.define(version: 2020_02_17_174922) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "just_join_it_parsed_offers", force: :cascade do |t|
    t.string "title", null: false
    t.string "city", null: false
    t.string "company_name", null: false
    t.string "company_url"
    t.integer "salary_from", null: false
    t.integer "salary_to", null: false
    t.string "skills", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "just_join_it_raw_offer_id"
    t.string "offer_url", null: false
  end

  create_table "just_join_it_raw_data", force: :cascade do |t|
    t.string "body", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "just_join_it_raw_offers", force: :cascade do |t|
    t.string "body", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "just_join_it_raw_datum_id"
  end

  add_foreign_key "just_join_it_parsed_offers", "just_join_it_raw_offers"
  add_foreign_key "just_join_it_raw_offers", "just_join_it_raw_data"
end
