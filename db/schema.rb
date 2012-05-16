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

<<<<<<< HEAD
ActiveRecord::Schema.define(:version => 20120516131558) do
=======
ActiveRecord::Schema.define(:version => 20120515095146) do
>>>>>>> 8c6c111fb7093cc4b9c8e7c472ccaa04b5a8545e

  create_table "photos", :force => true do |t|
    t.string   "comment"
    t.string   "name"
    t.string   "content_type"
    t.binary   "original",     :limit => 16777215
    t.binary   "large"
    t.binary   "thumbnail"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "pros", :force => true do |t|
    t.string   "name",           :null => false
    t.string   "addr_zone",      :null => false
    t.string   "address",        :null => false
    t.integer  "phone",          :null => false
    t.string   "arr_name",       :null => false
    t.string   "arr_addr_zone",  :null => false
    t.string   "arr_address",    :null => false
    t.integer  "arr_phone",      :null => false
    t.text     "request_sender"
    t.string   "select"
    t.text     "test"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "talks", :force => true do |t|
    t.string   "name"
    t.string   "oname"
    t.boolean  "friend"
    t.boolean  "ofriend"
    t.text     "content"
    t.text     "ocontent"
    t.string   "test"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "hash_passwd"
    t.string   "passwd"
    t.string   "salt"
    t.string   "email"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
