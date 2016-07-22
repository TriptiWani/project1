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

ActiveRecord::Schema.define(version: 20160722082928) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "line_items", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "order_id"
    t.integer  "quantity"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.float    "sub_total"
    t.integer  "sub_total_cents", default: 0, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string   "status",            default: "new"
    t.string   "payment_method"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "user_id"
    t.float    "total_price"
    t.integer  "total_price_cents", default: 0,     null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "model_num"
    t.decimal  "price"
    t.integer  "num_of_pieces"
    t.string   "brand"
    t.string   "color"
    t.date     "mfg_date"
    t.text     "image"
    t.string   "type"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "category"
    t.integer  "price_cents",   default: 0,    null: false
    t.boolean  "active",        default: true
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.date     "dob"
    t.string   "gender"
    t.string   "password_digest"
    t.string   "phone_number"
    t.text     "address"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "admin",           default: false
    t.text     "image"
    t.boolean  "active",          default: true
    t.string   "currency",        default: "AUD"
  end

end
