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

ActiveRecord::Schema[7.2].define(version: 2024_09_16_051824) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.string "role"
    t.index ["email", "role"], name: "index_users_on_email_and_role", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "consumer_outlets", "consumers"
  add_foreign_key "products", "tenants"
  add_foreign_key "products", "users"
  add_foreign_key "resources", "tenants"
  add_foreign_key "resources", "users"
end
