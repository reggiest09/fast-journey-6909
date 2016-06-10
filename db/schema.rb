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

ActiveRecord::Schema.define(version: 20160609061930) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "coupons", force: :cascade do |t|
    t.string   "coupon_code"
    t.integer  "user_id"
    t.integer  "subscription_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "active",          default: false
    t.string   "plan_name"
    t.string   "plan"
  end

  create_table "stripe_charges", force: :cascade do |t|
    t.float    "amount"
    t.string   "currency",           default: "usd"
    t.text     "description"
    t.integer  "stripe_customer_id"
    t.integer  "user_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "stripe_customers", force: :cascade do |t|
    t.string   "object"
    t.string   "description"
    t.boolean  "livemode"
    t.integer  "created_timestamp"
    t.string   "reference_id"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "stripe_plans", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "plan_name"
    t.string   "price"
    t.string   "reference_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "plan_type"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string   "plan_name"
    t.integer  "user_id"
    t.string   "stripe_card_token"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.boolean  "active",             default: true
    t.integer  "stripe_customer_id"
    t.boolean  "tos_payment",        default: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.integer  "age"
    t.string   "school_name"
    t.integer  "grade_year"
    t.string   "home_address"
    t.string   "home_city"
    t.string   "home_state"
    t.string   "home_zip_code"
    t.text     "ada_accommodation"
    t.string   "parent_gurdin_email"
    t.string   "mother_name"
    t.string   "mother_day_number"
    t.string   "mother_cell_num"
    t.string   "father_name"
    t.string   "father_day_number"
    t.string   "father_cell_number"
    t.text     "persons_auth"
    t.text     "other_arrangements"
    t.text     "emergency_contact"
    t.text     "child_helath_prob"
    t.boolean  "child_midication"
    t.text     "child_midication_desc"
    t.text     "snack"
    t.boolean  "employee_qc"
    t.string   "plan"
    t.string   "plan_name"
    t.boolean  "tos_payment",            default: false
    t.string   "holiday"
    t.string   "phone"
    t.string   "primary_phone"
    t.string   "dob"
    t.string   "grand_level"
    t.string   "event"
    t.string   "shirt_size"
    t.string   "company"
    t.string   "register_for"
    t.string   "player_weight"
    t.string   "amount"
    t.string   "parent_name"
    t.string   "parent_email"
    t.string   "child_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
