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

ActiveRecord::Schema.define(version: 20140216233638) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "date_requests", force: true do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "date_phone"
    t.string   "date_username"
    t.string   "date_username_site"
    t.text     "date_comment"
    t.string   "date_rating"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "matched",            default: false
  end

  create_table "date_responses", force: true do |t|
    t.integer  "date_request_id"
    t.string   "date_response_first_name"
    t.string   "date_response_last_name"
    t.string   "date_response_phone"
    t.string   "date_response_username"
    t.string   "date_response_site"
    t.text     "date_response_comment"
    t.string   "date_response_rating"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "date_requester_id"
    t.integer  "date_responder_id"
    t.string   "uniq_phone_identifier"
  end

  create_table "friend_sayings", force: true do |t|
    t.string   "saying"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_dating_usernames", force: true do |t|
    t.integer  "dating_site_id"
    t.integer  "user_id"
    t.string   "dating_site_username"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "dating_site_website"
    t.string   "uniq_username"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "user_phone"
    t.string   "user_handle"
    t.boolean  "admin"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "password"
    t.string   "password_confirmation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url_slug"
    t.string   "image"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.string   "email_confirm_token"
    t.datetime "email_confirm_sent_at"
    t.boolean  "email_confirmed",        default: false
    t.boolean  "profile_name_hidden",    default: false
    t.string   "city"
    t.string   "state"
    t.boolean  "hide_city_state",        default: false
    t.boolean  "receive_notifications",  default: true
    t.string   "provider"
    t.string   "uid"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "fb_image"
    t.string   "fb_location"
    t.boolean  "fb_verified"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["url_slug"], name: "index_users_on_url_slug", using: :btree
  add_index "users", ["user_handle"], name: "index_users_on_user_handle", unique: true, using: :btree

  create_table "yes_sayings", force: true do |t|
    t.string   "saying"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
