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

ActiveRecord::Schema.define(:version => 20121219103925) do

  create_table "dash_types", :force => true do |t|
    t.string   "name"
    t.string   "properties"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "dashes", :force => true do |t|
    t.string   "name"
    t.integer  "dash_type_id"
    t.string   "widgets"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "sources", :force => true do |t|
    t.string   "name"
    t.integer  "source_type_id"
    t.string   "properties"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.string   "email"
    t.string   "phone"
    t.integer  "source_id"
    t.string   "google_token"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "widget_types", :force => true do |t|
    t.string   "name"
    t.string   "properties"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "widgets", :force => true do |t|
    t.string   "name"
    t.integer  "widget_type_id"
    t.string   "sources"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

end