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

ActiveRecord::Schema[7.0].define(version: 2023_06_05_231158) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collective_genres", force: :cascade do |t|
    t.bigint "collective_id", null: false
    t.bigint "genre_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collective_id"], name: "index_collective_genres_on_collective_id"
    t.index ["genre_id"], name: "index_collective_genres_on_genre_id"
  end

  create_table "collectives", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.string "logo"
    t.string "city"
    t.string "state"
    t.bigint "owner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_collectives_on_owner_id"
  end

  create_table "event_genres", force: :cascade do |t|
    t.bigint "genre_id", null: false
    t.bigint "collective_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collective_id"], name: "index_event_genres_on_collective_id"
    t.index ["genre_id"], name: "index_event_genres_on_genre_id"
  end

  create_table "event_list_subscriptions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "event_list_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_list_id"], name: "index_event_list_subscriptions_on_event_list_id"
    t.index ["user_id"], name: "index_event_list_subscriptions_on_user_id"
  end

  create_table "event_lists", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.string "name"
    t.text "requirement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_lists_on_event_id"
  end

  create_table "events", force: :cascade do |t|
    t.bigint "collective_id", null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "ticket_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collective_id"], name: "index_events_on_collective_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "memberships", force: :cascade do |t|
    t.bigint "collective_id", null: false
    t.bigint "user_id", null: false
    t.boolean "dj"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collective_id"], name: "index_memberships_on_collective_id"
    t.index ["user_id"], name: "index_memberships_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.text "content"
    t.bigint "collective_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collective_id"], name: "index_posts_on_collective_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.bigint "collective_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collective_id"], name: "index_subscriptions_on_collective_id"
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "collective_genres", "collectives"
  add_foreign_key "collective_genres", "genres"
  add_foreign_key "collectives", "users", column: "owner_id"
  add_foreign_key "event_genres", "collectives"
  add_foreign_key "event_genres", "genres"
  add_foreign_key "event_list_subscriptions", "event_lists"
  add_foreign_key "event_list_subscriptions", "users"
  add_foreign_key "event_lists", "events"
  add_foreign_key "events", "collectives"
  add_foreign_key "memberships", "collectives"
  add_foreign_key "memberships", "users"
  add_foreign_key "posts", "collectives"
  add_foreign_key "subscriptions", "collectives"
  add_foreign_key "subscriptions", "users"
end
