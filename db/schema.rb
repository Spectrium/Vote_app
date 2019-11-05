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

ActiveRecord::Schema.define(version: 2019_11_05_054035) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candidats", force: :cascade do |t|
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "communes", force: :cascade do |t|
    t.string "name"
    t.bigint "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region_id"], name: "index_communes_on_region_id"
  end

  create_table "fokontanies", force: :cascade do |t|
    t.string "name"
    t.bigint "commune_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commune_id"], name: "index_fokontanies_on_commune_id"
  end

  create_table "recensements", force: :cascade do |t|
    t.string "full_name"
    t.string "cin"
    t.string "contact"
    t.bigint "fokontany_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fokontany_id"], name: "index_recensements_on_fokontany_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "nom"
    t.boolean "is_admin"
    t.string "email"
    t.string "password"
    t.bigint "region_id"
    t.bigint "commune_id"
    t.bigint "fokontany_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commune_id"], name: "index_users_on_commune_id"
    t.index ["fokontany_id"], name: "index_users_on_fokontany_id"
    t.index ["region_id"], name: "index_users_on_region_id"
  end

  create_table "votes", force: :cascade do |t|
    t.bigint "recensement_id"
    t.bigint "candidat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidat_id"], name: "index_votes_on_candidat_id"
    t.index ["recensement_id"], name: "index_votes_on_recensement_id"
  end

  add_foreign_key "communes", "regions"
  add_foreign_key "fokontanies", "communes"
  add_foreign_key "recensements", "fokontanies"
  add_foreign_key "users", "communes"
  add_foreign_key "users", "fokontanies"
  add_foreign_key "users", "regions"
  add_foreign_key "votes", "candidats"
  add_foreign_key "votes", "recensements"
end
