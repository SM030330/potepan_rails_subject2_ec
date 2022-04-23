# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_04_17_053318) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "reserves", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "room_id"
    t.date "startdate"
    t.date "finishdate"
    t.integer "member_sum"
    t.index ["room_id", "user_id"], name: "index_reserves_on_room_id_and_user_id", unique: true
    t.index ["room_id"], name: "index_reserves_on_room_id"
    t.index ["user_id"], name: "index_reserves_on_user_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.text "info"
    t.integer "value"
    t.string "address"
    t.bigint "user_id", null: false
    t.index ["address"], name: "index_rooms_on_address"
    t.index ["info"], name: "index_rooms_on_info"
    t.index ["name"], name: "index_rooms_on_name"
    t.index ["user_id"], name: "index_rooms_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", default: "user"
    t.text "info"
    t.string "email", null: false
    t.string "password_digest", null: false
    t.boolean "login_acitve"
  end

  add_foreign_key "rooms", "users"
end
