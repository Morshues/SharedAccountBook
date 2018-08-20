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

ActiveRecord::Schema.define(version: 2018_08_20_132423) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.bigint "owner_id"
    t.string "name"
    t.string "currency_name"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_books_on_owner_id"
  end

  create_table "exchanges", force: :cascade do |t|
    t.bigint "book_id"
    t.string "currency"
    t.float "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_exchanges_on_book_id"
  end

  create_table "flows", force: :cascade do |t|
    t.bigint "item_id"
    t.bigint "member_id"
    t.float "number", default: 0.0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_flows_on_item_id"
    t.index ["member_id"], name: "index_flows_on_member_id"
  end

  create_table "items", force: :cascade do |t|
    t.bigint "book_id"
    t.string "title"
    t.float "price", default: 0.0, null: false
    t.datetime "time"
    t.bigint "exchange_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_items_on_book_id"
    t.index ["exchange_id"], name: "index_items_on_exchange_id"
  end

  create_table "members", force: :cascade do |t|
    t.bigint "book_id"
    t.bigint "user_id"
    t.string "nickname"
    t.string "key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_members_on_book_id"
    t.index ["user_id"], name: "index_members_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "name", default: "", null: false
    t.string "image", default: "", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
