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

ActiveRecord::Schema.define(version: 2023_01_30_222814) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ancestries", force: :cascade do |t|
    t.bigint "nation_id"
    t.boolean "darkvision"
    t.integer "population"
    t.string "name"
    t.string "patron_deity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nation_id"], name: "index_ancestries_on_nation_id"
  end

  create_table "nations", force: :cascade do |t|
    t.boolean "landlocked"
    t.integer "population"
    t.string "name"
    t.string "national_language"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "ancestries", "nations"
end
