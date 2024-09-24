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


ActiveRecord::Schema[7.2].define(version: 2024_09_19_034052) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "child_groups", force: :cascade do |t|
    t.string "status"
    t.string "planned_at"
    t.string "completed_at"
    t.bigint "consumer_id", null: false
    t.bigint "user_id", null: false
    t.bigint "tenant_id", null: false
    t.bigint "order_group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "delivery_order_id"
    t.index ["consumer_id"], name: "index_child_groups_on_consumer_id"
    t.index ["delivery_order_id"], name: "index_child_groups_on_delivery_order_id"
    t.index ["order_group_id"], name: "index_child_groups_on_order_group_id"
    t.index ["tenant_id"], name: "index_child_groups_on_tenant_id"
    t.index ["user_id"], name: "index_child_groups_on_user_id"
  end

  create_table "consumer_outlets", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "consumer_id", null: false
    t.index ["consumer_id"], name: "index_consumer_outlets_on_consumer_id"
  end

  create_table "consumers", force: :cascade do |t|
    t.string "name"
    t.integer "tenant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.string "email"
    t.string "phone_number"
  end

  create_table "delivery_orders", force: :cascade do |t|
    t.string "planned_at"
    t.string "completed_at"
    t.bigint "consumer_outlet_id", null: false
    t.bigint "order_group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "child_group_id"
    t.index ["child_group_id"], name: "index_delivery_orders_on_child_group_id"
    t.index ["consumer_outlet_id"], name: "index_delivery_orders_on_consumer_outlet_id"
    t.index ["order_group_id"], name: "index_delivery_orders_on_order_group_id"
  end

  create_table "line_items", force: :cascade do |t|
    t.bigint "delivery_order_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "product_id", null: false
    t.string "status"
    t.integer "quantity"
    t.index ["delivery_order_id"], name: "index_line_items_on_delivery_order_id"
    t.index ["product_id"], name: "index_line_items_on_product_id"
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
    t.string "frequency"
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean "recurring"
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
    t.bigint "tenant_id"
    t.bigint "user_id"
    t.index ["tenant_id"], name: "index_products_on_tenant_id"
    t.index ["user_id"], name: "index_products_on_user_id"
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

  add_foreign_key "child_groups", "delivery_orders"
  add_foreign_key "child_groups", "order_groups", on_delete: :cascade
  add_foreign_key "consumer_outlets", "consumers", on_delete: :cascade
  add_foreign_key "delivery_orders", "child_groups", on_delete: :cascade
  add_foreign_key "delivery_orders", "consumer_outlets"
  add_foreign_key "delivery_orders", "order_groups", on_delete: :cascade
  add_foreign_key "line_items", "delivery_orders", on_delete: :cascade
  add_foreign_key "order_groups", "consumers", on_delete: :cascade
  add_foreign_key "order_groups", "tenants"
  add_foreign_key "order_groups", "users"
  add_foreign_key "products", "tenants"
  add_foreign_key "products", "users"
  add_foreign_key "resources", "tenants"
  add_foreign_key "resources", "users"
end
