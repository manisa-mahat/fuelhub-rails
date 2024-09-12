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

ActiveRecord::Schema[7.2].define(version: 2024_09_09_040921) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "consumer_outlets", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "consumers", force: :cascade do |t|
    t.string "name"
    t.integer "tenant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delivery_orders", force: :cascade do |t|
    t.string "planned_at"
    t.string "completed_at"
    t.bigint "consumer_outlet_id", null: false
    t.bigint "order_group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["consumer_outlet_id"], name: "index_delivery_orders_on_consumer_outlet_id"
    t.index ["order_group_id"], name: "index_delivery_orders_on_order_group_id"
  end

  create_table "drivers", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.string "status"
    t.bigint "tenant_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tenant_id"], name: "index_drivers_on_tenant_id"
    t.index ["user_id"], name: "index_drivers_on_user_id"
  end

  create_table "line_items", force: :cascade do |t|
    t.string "name"
    t.string "quantity"
    t.string "unit"
    t.string "status"
    t.bigint "delivery_order_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["delivery_order_id"], name: "index_line_items_on_delivery_order_id"
  end

  create_table "order_groups", force: :cascade do |t|
    t.string "status"
    t.string "planned_at"
    t.string "completed_at"
    t.bigint "consumer_id", null: false
    t.bigint "user_id", null: false
    t.bigint "tenant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["consumer_id"], name: "index_order_groups_on_consumer_id"
    t.index ["tenant_id"], name: "index_order_groups_on_tenant_id"
    t.index ["user_id"], name: "index_order_groups_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category"
    t.string "name"
    t.string "status"
    t.string "unit"
  end

  create_table "resources", force: :cascade do |t|
    t.string "resource_category"
    t.string "resource_status"
    t.bigint "user_id", null: false
    t.bigint "tenant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tenant_id"], name: "index_resources_on_tenant_id"
    t.index ["user_id"], name: "index_resources_on_user_id"
  end

  create_table "tenants", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tenant_id"
    t.string "jti"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "resources", "tenants"
  add_foreign_key "resources", "users"
end
