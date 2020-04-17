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

ActiveRecord::Schema.define(version: 2020_04_08_173155) do

  create_table "consume_preferences", force: :cascade do |t|
    t.integer "party_guest_id"
    t.integer "type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["party_guest_id"], name: "index_consume_preferences_on_party_guest_id"
    t.index ["type_id"], name: "index_consume_preferences_on_type_id"
  end

  create_table "melanges", force: :cascade do |t|
    t.string "name"
    t.date "event_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "party_guests", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.integer "melange_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["melange_id"], name: "index_party_guests_on_melange_id"
    t.index ["user_id"], name: "index_party_guests_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.integer "price", default: 0, null: false
    t.integer "party_guest_id"
    t.integer "type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["party_guest_id"], name: "index_products_on_party_guest_id"
    t.index ["type_id"], name: "index_products_on_type_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "melange_id"
    t.index ["melange_id"], name: "index_types_on_melange_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 1
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
