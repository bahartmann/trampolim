# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141020021846) do

  create_table "comments", force: true do |t|
    t.text     "text"
    t.integer  "user_profile_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "title",           default: "", null: false
    t.text     "about"
    t.string   "category"
    t.datetime "datetime"
    t.integer  "price"
    t.integer  "user_profile_id"
    t.string   "poster"
  end

  create_table "events_guests", id: false, force: true do |t|
    t.integer "event_id"
    t.integer "user_profile_id"
  end

  create_table "followers", id: false, force: true do |t|
    t.integer "user_profile_id"
    t.integer "follower_id"
  end

  create_table "places", force: true do |t|
    t.string  "name"
    t.string  "formatted_address"
    t.decimal "lat"
    t.decimal "lon"
    t.integer "event_id"
  end

  create_table "ratings", force: true do |t|
    t.integer "value"
    t.integer "user_profile_id"
    t.integer "event_id"
  end

  create_table "user_profiles", force: true do |t|
    t.string  "name"
    t.text    "about"
    t.integer "user_id"
  end

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
