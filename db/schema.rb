# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_04_22_181232) do
  create_table "assignments", force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_assignments_on_category_id"
    t.index ["item_id"], name: "index_assignments_on_item_id"
  end

  create_table "carts", id: false, force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "order_id", null: false
    t.float "price"
    t.integer "quantity"
    t.float "sub_total_price"
    t.index ["item_id", "order_id"], name: "index_carts_on_item_id_and_order_id"
    t.index ["order_id", "item_id"], name: "index_carts_on_order_id_and_item_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.float "total_price"
    t.date "order_date"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  add_foreign_key "assignments", "categories"
  add_foreign_key "assignments", "items"
  add_foreign_key "orders", "customers"
end
