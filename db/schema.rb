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

ActiveRecord::Schema.define(version: 20150309062853) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: :cascade do |t|
    t.string   "username",        limit: 50
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["username"], name: "index_admin_users_on_username", using: :btree

  create_table "carousel_images", force: :cascade do |t|
    t.integer "position"
    t.string  "image"
    t.string  "title"
    t.string  "description"
  end

  create_table "event_items", force: :cascade do |t|
    t.text     "short_entry"
    t.text     "long_entry"
    t.string   "event_date",     limit: 150
    t.string   "permalink",      limit: 175
    t.datetime "event_datetime"
    t.integer  "position"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "file_entries", force: :cascade do |t|
    t.string   "name",        limit: 275
    t.text     "description"
    t.integer  "file_type"
    t.string   "permalink",   limit: 175
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "file"
  end

  create_table "headers", force: :cascade do |t|
    t.string   "name",       limit: 175
    t.string   "content",    limit: 575
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "mineral_data", force: :cascade do |t|
    t.string   "mine_name",  limit: 175
    t.integer  "data_type"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "mine_data",              default: [],              array: true
  end

  create_table "news_items", force: :cascade do |t|
    t.string   "short_entry", limit: 375
    t.string   "permalink",   limit: 175
    t.text     "long_entry"
    t.string   "news_date",   limit: 150
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "shares", force: :cascade do |t|
    t.string   "type",        limit: 175
    t.integer  "amount"
    t.string   "amount_text"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "staff_entries", force: :cascade do |t|
    t.string   "name",            limit: 75
    t.text     "summary"
    t.boolean  "is_board_member",             default: false
    t.string   "appointed_date",  limit: 175
    t.string   "committee1",      limit: 175
    t.string   "committee2",      limit: 175
    t.string   "committee3",      limit: 175
    t.string   "committee4",      limit: 175
    t.string   "photo1",          limit: 175
    t.string   "photo2",          limit: 175
    t.integer  "section"
    t.integer  "position"
    t.string   "permalink",       limit: 175
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.string   "title"
  end

  create_table "tcontents", force: :cascade do |t|
    t.integer "stringid"
    t.text    "data"
  end

  add_index "tcontents", ["stringid"], name: "index_tcontents_on_stringid", using: :btree

end
