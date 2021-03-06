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

ActiveRecord::Schema.define(version: 2018_06_21_145653) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bbsitters", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "language"
    t.integer "price"
    t.integer "age"
    t.string "city"
    t.text "description"
    t.string "photo"
    t.integer "experience"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_bbsitters_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "reservation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reservation_id"], name: "index_messages_on_reservation_id"
  end

  create_table "parents", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "age_of_kid"
    t.string "name_of_kid"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_parents_on_user_id"
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.bigint "searchable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.date "reservation_date"
    t.boolean "status", default: false
    t.bigint "parent_id"
    t.bigint "bbsitter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bbsitter_id"], name: "index_reservations_on_bbsitter_id"
    t.index ["parent_id"], name: "index_reservations_on_parent_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.boolean "is_parent", default: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bbsitters", "users"
  add_foreign_key "messages", "reservations"
  add_foreign_key "parents", "users"
  add_foreign_key "reservations", "bbsitters"
  add_foreign_key "reservations", "parents"
end
