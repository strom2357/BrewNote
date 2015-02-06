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

ActiveRecord::Schema.define(version: 20150206044037) do

  create_table "brew_seshes", force: true do |t|
    t.integer  "user_id"
    t.integer  "brew_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "brews", force: true do |t|
    t.string   "name"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fermentations", force: true do |t|
    t.integer  "brew_id"
    t.float    "original_gravity"
    t.float    "final_gravity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grain_mashes", force: true do |t|
    t.integer  "brew_id"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grains", force: true do |t|
    t.string   "name"
    t.string   "quantity"
    t.string   "mash_temp"
    t.string   "mash_time"
    t.integer  "grain_mash_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hop_additions", force: true do |t|
    t.integer  "brew_id"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hops", force: true do |t|
    t.string   "name"
    t.string   "form"
    t.string   "quantity"
    t.string   "boil_time"
    t.integer  "hop_addition_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "malt_additions", force: true do |t|
    t.integer  "brew_id"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "malts", force: true do |t|
    t.string   "name"
    t.string   "quantity"
    t.integer  "malt_addition_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "primaries", force: true do |t|
    t.integer  "fermentation_id"
    t.string   "fermentation_temp"
    t.string   "duration"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "secondaries", force: true do |t|
    t.integer  "fermentation_id"
    t.string   "duration"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "secondary_addtions", force: true do |t|
    t.integer  "secondary_id"
    t.string   "name"
    t.string   "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name",            null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "yeast_pitches", force: true do |t|
    t.integer  "brew_id"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "yeasts", force: true do |t|
    t.string   "name"
    t.string   "pitch_temp"
    t.string   "quantity"
    t.integer  "yeast_pitch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
