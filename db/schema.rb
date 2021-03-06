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

ActiveRecord::Schema.define(version: 2020_09_25_145820) do

  create_table "climbing_routes", force: :cascade do |t|
    t.string "name"
    t.string "style"
    t.string "difficulty"
    t.string "pitches"
    t.string "location"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "favorite_routes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "climbing_route_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["climbing_route_id"], name: "index_favorite_routes_on_climbing_route_id"
    t.index ["user_id"], name: "index_favorite_routes_on_user_id"
  end

  create_table "partnerships", force: :cascade do |t|
    t.integer "requestor_id"
    t.integer "receiver_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "partnership_status", default: "pending"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "aboutme"
    t.string "climbing_skill"
    t.string "climbing_style"
    t.text "location"
    t.string "belay_status", default: "unavailable"
  end

end
