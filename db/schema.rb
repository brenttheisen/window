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

ActiveRecord::Schema.define(version: 20150707144712) do

  create_table "biz_promos", force: :cascade do |t|
    t.string   "business_name"
    t.string   "twitter_handle"
    t.string   "website_url"
    t.string   "facebook_url"
    t.string   "instagram_handle"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "tweeted"
    t.string   "logo"
  end

  create_table "companies", force: :cascade do |t|
    t.string   "company"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "link"
    t.string   "email"
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.text     "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "emails", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "phone"
    t.string   "website"
  end

  create_table "promos", force: :cascade do |t|
    t.string   "twitter_handle"
    t.string   "band_name"
    t.string   "youtube_channel"
    t.string   "website_link"
    t.string   "itunes_link"
    t.string   "soundcloud_link"
    t.string   "fb_link"
    t.string   "insta_link"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "tweeted"
    t.string   "logo"
  end

  create_table "shippings", force: :cascade do |t|
    t.string   "email"
    t.string   "address"
    t.string   "name"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
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
