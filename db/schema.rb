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

ActiveRecord::Schema.define(version: 20161216214349) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "beans", force: :cascade do |t|
    t.string   "name",                     default: "Name"
    t.integer  "roaster_id",               default: 0
    t.string   "website_url"
    t.string   "image_url"
    t.string   "flavor_note_1"
    t.string   "flavor_note_3"
    t.float    "price_per_bag"
    t.float    "bag_size_grams"
    t.integer  "elevation_masl_low"
    t.integer  "elevation_masl_high"
    t.string   "process"
    t.string   "varietal"
    t.integer  "origin_country_id"
    t.boolean  "caffine"
    t.string   "region"
    t.boolean  "blend"
    t.boolean  "espresso"
    t.string   "producer"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "reviews_count"
    t.float    "region_latitude"
    t.float    "region_longitude"
    t.string   "region_formatted_address"
    t.float    "rating"
  end

  create_table "friend_requests", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.string   "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "inventories", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "bean_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "review_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "origin_countries", force: :cascade do |t|
    t.text     "description"
    t.string   "cover_photo_url"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "beans_count"
    t.float    "location_latitude"
    t.float    "location_longitude"
    t.string   "location_formatted_address"
    t.float    "rating"
  end

  create_table "responses", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "review_id"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "bean_id"
    t.float    "overall_rating"
    t.text     "comments"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roasters", force: :cascade do |t|
    t.text     "description"
    t.string   "name"
    t.string   "website_url"
    t.string   "location"
    t.string   "cover_photo_url"
    t.string   "city"
    t.boolean  "delivers"
    t.string   "delivery_method"
    t.text     "delivery_notes"
    t.string   "delivery_geography"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "beans_count"
    t.float    "location_latitude"
    t.float    "location_longitude"
    t.string   "location_formatted_address"
    t.float    "rating"
  end

  create_table "stories", force: :cascade do |t|
    t.string   "heading"
    t.string   "image_url"
    t.text     "content"
    t.string   "link"
    t.string   "misc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "inventories_count"
    t.integer  "reviews_count"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
