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

ActiveRecord::Schema.define(version: 2022_08_04_000920) do

  create_table "account_subscriptions", force: :cascade do |t|
    t.integer "account_id", null: false
    t.integer "subscription_plan_id", null: false
    t.integer "invoice_id"
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.integer "status", null: false
    t.integer "billing_period", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_account_subscriptions_on_account_id"
    t.index ["invoice_id"], name: "index_account_subscriptions_on_invoice_id"
    t.index ["subscription_plan_id"], name: "index_account_subscriptions_on_subscription_plan_id"
  end

  create_table "account_users", force: :cascade do |t|
    t.integer "account_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id", "user_id"], name: "index_account_users_on_account_id_and_user_id", unique: true
    t.index ["account_id"], name: "index_account_users_on_account_id"
    t.index ["user_id"], name: "index_account_users_on_user_id"
  end

  create_table "accounts", force: :cascade do |t|
    t.string "name", null: false
    t.string "type", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "attachments", force: :cascade do |t|
    t.string "file"
    t.string "name"
    t.string "type"
    t.string "size"
    t.string "path"
    t.string "url"
    t.integer "user_id", null: false
    t.integer "attachmentable_id"
    t.string "attachmentable_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_attachments_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.text "body", null: false
    t.integer "parent_id"
    t.string "commentable_type"
    t.integer "commentable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "contents", force: :cascade do |t|
    t.text "body"
    t.json "options"
    t.integer "template_section_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["template_section_id"], name: "index_contents_on_template_section_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.integer "account_subscription_id", null: false
    t.integer "type", null: false
    t.integer "status", null: false
    t.date "due_date", null: false
    t.decimal "total_amount", precision: 10, scale: 2, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_subscription_id"], name: "index_invoices_on_account_subscription_id"
  end

  create_table "options_contents", force: :cascade do |t|
    t.json "options", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "subscription_plans", force: :cascade do |t|
    t.string "name", null: false
    t.integer "max_users", null: false
    t.integer "max_templates", null: false
    t.decimal "price_per_month", precision: 10, scale: 2, null: false
    t.decimal "price_per_year", precision: 10, scale: 2, null: false
    t.decimal "price_per_user_month", precision: 10, scale: 2, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "template_sections", force: :cascade do |t|
    t.integer "template_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["template_id"], name: "index_template_sections_on_template_id"
  end

  create_table "templates", force: :cascade do |t|
    t.string "name"
    t.integer "account_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_templates_on_account_id"
    t.index ["user_id"], name: "index_templates_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "name"
    t.string "password_digest"
    t.string "email"
    t.string "provider"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "account_subscriptions", "accounts"
  add_foreign_key "account_subscriptions", "invoices"
  add_foreign_key "account_subscriptions", "subscription_plans"
  add_foreign_key "account_users", "accounts"
  add_foreign_key "account_users", "users"
  add_foreign_key "accounts", "users"
  add_foreign_key "attachments", "users"
  add_foreign_key "comments", "users"
  add_foreign_key "contents", "template_sections"
  add_foreign_key "invoices", "account_subscriptions"
  add_foreign_key "template_sections", "templates"
  add_foreign_key "templates", "accounts"
  add_foreign_key "templates", "users"
end
