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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130428091918) do

  create_table "cards", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "privacy"
    t.text     "desc"
    t.string   "typ"
  end

  create_table "foursquares", :force => true do |t|
    t.integer  "remote_id"
    t.string   "name"
    t.string   "phone"
    t.string   "address"
    t.integer  "lat"
    t.integer  "long"
    t.float    "rating"
    t.integer  "here_now"
    t.text     "tip"
    t.string   "short_url"
    t.string   "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "props", :force => true do |t|
    t.string   "k"
    t.string   "v"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "card_id"
  end

  create_table "tokens", :force => true do |t|
    t.integer  "card_id"
    t.string   "code"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
