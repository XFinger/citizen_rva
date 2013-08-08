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

ActiveRecord::Schema.define(:version => 20130525035016) do

  create_table "addresses", :force => true do |t|
    t.integer  "user_id"
    t.string   "contact_name"
    t.string   "phone"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.float    "lat"
    t.float    "lng"
    t.boolean  "is_default"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.boolean  "gmaps"
  end

  create_table "blogs", :force => true do |t|
    t.string   "pic"
    t.string   "title"
    t.datetime "published_on"
    t.text     "post"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "published",    :default => false
  end

  create_table "boxmenus", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "box_pdf"
  end

  create_table "breakfasts", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "useable_id"
    t.string   "useable_type"
    t.decimal  "price",        :precision => 4, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dishes", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "useable_id"
    t.string   "useable_type"
    t.decimal  "price",        :precision => 4, :scale => 2
    t.integer  "count"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_sand"
    t.string   "alt_desc"
  end

  create_table "drinks", :force => true do |t|
    t.string   "d_name"
    t.integer  "useable_id"
    t.string   "useable_type"
    t.decimal  "d_price",      :precision => 4, :scale => 2
    t.integer  "d_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "galleries", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "maps", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menus", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pdf"
  end

  create_table "orders", :force => true do |t|
    t.datetime "delivery_time"
    t.boolean  "confirmed"
    t.integer  "user_id"
    t.decimal  "ttl_price",         :precision => 10, :scale => 2
    t.decimal  "sub_ttl",           :precision => 10, :scale => 2
    t.decimal  "tax",               :precision => 10, :scale => 2
    t.boolean  "delivery"
    t.integer  "address_id"
    t.text     "delivery_instruct"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", :force => true do |t|
    t.integer  "gallery_id"
    t.string   "caption"
    t.integer  "position"
    t.string   "image"
    t.string   "name"
    t.string   "remote_image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "punchclocks", :force => true do |t|
    t.string   "user_name"
    t.integer  "payperiod"
    t.datetime "in"
    t.datetime "out"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "paydate"
  end

  create_table "salads", :force => true do |t|
    t.string   "sal_name"
    t.string   "sal_description"
    t.string   "useable_id"
    t.string   "useable_type"
    t.decimal  "sal_price",       :precision => 4, :scale => 2
    t.integer  "sal_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sides", :force => true do |t|
    t.string   "s_name"
    t.string   "s_description"
    t.integer  "useable_id"
    t.string   "useable_type"
    t.decimal  "s_price",       :precision => 4, :scale => 2
    t.integer  "s_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "role"
    t.integer  "roles_mask"
    t.string   "aasm_state",             :default => "out"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
