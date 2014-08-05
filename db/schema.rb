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

ActiveRecord::Schema.define(version: 20140804095052) do

  create_table "orders", force: true do |t|
    t.integer  "user_id"
    t.integer  "unit_count"
    t.integer  "store_weeks"
    t.integer  "charge"
    t.string   "pickup_address"
    t.string   "delivery_address"
    t.text     "why_ordering"
    t.text     "question"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "pickup_datetime"
    t.datetime "delivery_datetime"
  end

  add_index "orders", ["delivery_datetime"], name: "index_orders_on_delivery_datetime"
  add_index "orders", ["pickup_datetime"], name: "index_orders_on_pickup_datetime"
  add_index "orders", ["user_id", "created_at"], name: "index_orders_on_user_id_and_created_at"

  create_table "units", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
    t.integer  "order_id"
    t.string   "content"
    t.string   "name"
  end

  add_index "units", ["order_id"], name: "index_units_on_order_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "knowing_route"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
    t.datetime "birthday"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
