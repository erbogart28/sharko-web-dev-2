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

ActiveRecord::Schema.define(version: 20170219204249) do

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cater_order_options", force: :cascade do |t|
    t.string   "cateringOptions"
    t.string   "CaterDesc"
    t.string   "sideOptions"
    t.string   "sideDesc"
    t.decimal  "price"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "line_items", force: :cascade do |t|
    t.integer  "cater_order_option_id"
    t.integer  "cart_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "quantity",              default: 1
    t.integer  "order_id"
    t.index ["cart_id"], name: "index_line_items_on_cart_id"
    t.index ["cater_order_option_id"], name: "index_line_items_on_cater_order_option_id"
    t.index ["order_id"], name: "index_line_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string   "name"
    t.text     "address"
    t.string   "email"
    t.string   "phone_number"
    t.integer  "pay_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "FullName"
    t.string   "email"
    t.string   "PhoneNumber"
    t.string   "password"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.boolean  "admin",           default: false
    t.string   "remember_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
