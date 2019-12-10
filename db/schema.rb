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

ActiveRecord::Schema.define(version: 2019_12_10_190039) do

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "city"
    t.string "postcode"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "cards", force: :cascade do |t|
    t.string "name"
    t.string "card_type"
    t.integer "level"
    t.string "race"
    t.string "card_attribute"
    t.integer "atk"
    t.integer "def"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "credit_cards", force: :cascade do |t|
    t.string "number"
    t.string "exp_date"
    t.string "name_on_card"
    t.string "organisation"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_credit_cards_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id"
    t.integer "stock_id"
    t.string "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "payment_id"
    t.index ["payment_id"], name: "index_orders_on_payment_id"
    t.index ["stock_id"], name: "index_orders_on_stock_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.decimal "amount"
    t.integer "credit_card_id"
    t.integer "user_id"
    t.integer "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "pay_day"
    t.integer "address_id"
    t.index ["address_id"], name: "index_payments_on_address_id"
    t.index ["credit_card_id"], name: "index_payments_on_credit_card_id"
    t.index ["order_id"], name: "index_payments_on_order_id"
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.integer "card_id"
    t.integer "yugioh_set_id"
    t.string "print_tag"
    t.string "price"
    t.string "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "purchases"
    t.index ["card_id"], name: "index_stocks_on_card_id"
    t.index ["yugioh_set_id"], name: "index_stocks_on_yugioh_set_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "Admin_rights", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "yugioh_sets", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
