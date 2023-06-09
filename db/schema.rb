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

ActiveRecord::Schema[7.0].define(version: 2023_06_15_015930) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

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
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_genres_on_event_id"
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
    t.boolean "open", default: true
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
    t.string "name"
    t.text "description"
    t.float "latitude"
    t.float "longitude"
    t.string "zipcode"
    t.string "street"
    t.string "neighborhood"
    t.integer "street_number"
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
    t.boolean "dj", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "accepted", default: false
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
    t.string "username", null: false
    t.string "avatar"
    t.string "soundcloud"
    t.string "instagram"
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "collective_genres", "collectives"
  add_foreign_key "collective_genres", "genres"
  add_foreign_key "collectives", "users", column: "owner_id"
  add_foreign_key "event_genres", "events"
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
