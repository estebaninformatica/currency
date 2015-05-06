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

ActiveRecord::Schema.define(version: 20150505190726) do

  create_table "changes", force: :cascade do |t|
    t.integer  "currency_from", limit: 4
    t.integer  "currency_to",   limit: 4
    t.datetime "start_dt"
    t.datetime "end_dt"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "currencies", force: :cascade do |t|
    t.text     "description",  limit: 65535
    t.string   "name",         limit: 255
    t.string   "abbreviation", limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "type_changes", force: :cascade do |t|
    t.integer  "change_id",  limit: 4
    t.string   "name",       limit: 255
    t.datetime "start_dt"
    t.datetime "end_dt"
    t.float    "amount",     limit: 24
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "type_changes", ["change_id"], name: "index_type_changes_on_change_id", using: :btree

end
