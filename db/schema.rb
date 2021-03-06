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

ActiveRecord::Schema.define(version: 20180407181519) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adjustments", force: :cascade do |t|
    t.float "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "budgets", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_budgets_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "budget_id"
    t.index ["budget_id"], name: "index_categories_on_budget_id"
  end

  create_table "charge_category_adjustments", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "charge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "adjustment_id"
    t.index ["adjustment_id"], name: "index_charge_category_adjustments_on_adjustment_id"
    t.index ["category_id"], name: "index_charge_category_adjustments_on_category_id"
    t.index ["charge_id"], name: "index_charge_category_adjustments_on_charge_id"
  end

  create_table "charges", force: :cascade do |t|
    t.date "date"
    t.string "payee"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "budget_id"
    t.float "amount"
    t.index ["budget_id"], name: "index_charges_on_budget_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.integer "role", default: 0
  end

  add_foreign_key "budgets", "users"
  add_foreign_key "categories", "budgets"
  add_foreign_key "charge_category_adjustments", "adjustments"
  add_foreign_key "charge_category_adjustments", "categories"
  add_foreign_key "charge_category_adjustments", "charges"
  add_foreign_key "charges", "budgets"
end
