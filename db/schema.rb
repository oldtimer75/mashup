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

ActiveRecord::Schema.define(version: 20140518210317) do

  create_table "companies", force: true do |t|
    t.integer "al_id"
    t.boolean "community_profile"
    t.string  "name"
    t.string  "angellist_url"
    t.string  "logo_url"
    t.string  "thumb_url"
    t.integer "quality"
    t.string  "product_desc"
    t.string  "high_concept"
    t.integer "al_follower_count"
    t.string  "company_url"
    t.string  "crunchbase_url"
    t.string  "twitter_url"
    t.string  "blog_url"
    t.string  "video_url"
    t.string  "tags"
    t.string  "locations"
    t.string  "company_size"
    t.string  "company_type"
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
    t.string   "name"
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
