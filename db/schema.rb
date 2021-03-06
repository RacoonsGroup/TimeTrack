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

ActiveRecord::Schema.define(version: 20140507105449) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: true do |t|
    t.string   "title"
    t.string   "short_description"
    t.integer  "importance"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
  end

  add_index "articles", ["short_description"], name: "index_articles_on_short_description", using: :btree
  add_index "articles", ["title"], name: "index_articles_on_title", using: :btree
  add_index "articles", ["url"], name: "index_articles_on_url", using: :btree

  create_table "articles_users", force: true do |t|
    t.integer "article_id"
    t.integer "user_id"
  end

  create_table "notifications", force: true do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "project_name"
    t.string   "project_description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "disable"
    t.string   "payment_type"
  end

  create_table "qualifications", force: true do |t|
    t.string   "name"
    t.float    "base_wage"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rails_admin_histories", force: true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      limit: 2
    t.integer  "year",       limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], name: "index_rails_admin_histories", using: :btree

  create_table "time_entries", force: true do |t|
    t.integer  "user_id"
    t.string   "project"
    t.string   "name"
    t.float    "real_time"
    t.float    "time_points"
    t.string   "status"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date"
    t.integer  "project_id"
    t.string   "url"
    t.boolean  "payable"
    t.string   "evaluation"
    t.boolean  "is_visible_for_customer", default: false
  end

  add_index "time_entries", ["user_id"], name: "index_time_entries_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
    t.integer  "qualification_id"
    t.string   "name"
    t.string   "type"
    t.integer  "project_id"
    t.boolean  "approved",               default: false, null: false
  end

  add_index "users", ["approved"], name: "index_users_on_approved", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
