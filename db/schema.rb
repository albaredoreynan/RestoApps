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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120626054546) do

  create_table "branches", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "contact_number"
    t.integer  "client_id"
    t.integer  "concept_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "branches", ["client_id"], :name => "index_branches_on_client_id"
  add_index "branches", ["concept_id"], :name => "index_branches_on_concept_id"

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "client_id"
    t.integer  "concept_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "categories", ["client_id"], :name => "index_categories_on_client_id"
  add_index "categories", ["concept_id"], :name => "index_categories_on_concept_id"

  create_table "client_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "branch_id"
    t.integer  "concept_id"
    t.integer  "client_id"
    t.integer  "role_id"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "client_users", ["branch_id"], :name => "index_client_users_on_branch_id"
  add_index "client_users", ["client_id"], :name => "index_client_users_on_client_id"
  add_index "client_users", ["concept_id"], :name => "index_client_users_on_concept_id"
  add_index "client_users", ["email"], :name => "index_client_users_on_email", :unique => true
  add_index "client_users", ["reset_password_token"], :name => "index_client_users_on_reset_password_token", :unique => true
  add_index "client_users", ["role_id"], :name => "index_client_users_on_role_id"

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "contact_number"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "concepts", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "contact_number"
    t.integer  "client_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "concepts", ["client_id"], :name => "index_concepts_on_client_id"

  create_table "conversions", :force => true do |t|
    t.integer  "bigger_unit_id"
    t.integer  "smaller_unit_id"
    t.float    "conversion_factor"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "conversions", ["bigger_unit_id"], :name => "index_conversions_on_bigger_unit_id"
  add_index "conversions", ["smaller_unit_id"], :name => "index_conversions_on_smaller_unit_id"

  create_table "item_counts", :force => true do |t|
    t.integer  "item_id"
    t.integer  "unit_id"
    t.integer  "branch_id"
    t.integer  "concept_id"
    t.integer  "client_id"
    t.date     "entry_date"
    t.float    "stock_count"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "item_counts", ["branch_id"], :name => "index_item_counts_on_branch_id"
  add_index "item_counts", ["client_id"], :name => "index_item_counts_on_client_id"
  add_index "item_counts", ["concept_id"], :name => "index_item_counts_on_concept_id"
  add_index "item_counts", ["item_id"], :name => "index_item_counts_on_item_id"
  add_index "item_counts", ["unit_id"], :name => "index_item_counts_on_unit_id"

  create_table "items", :force => true do |t|
    t.string   "name"
    t.integer  "subcategory_id"
    t.integer  "unit_id"
    t.integer  "branch_id"
    t.integer  "concept_id"
    t.integer  "client_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "group"
    t.boolean  "is_active"
    t.float    "cost"
    t.float    "quantity"
  end

  add_index "items", ["branch_id"], :name => "index_items_on_branch_id"
  add_index "items", ["client_id"], :name => "index_items_on_client_id"
  add_index "items", ["concept_id"], :name => "index_items_on_concept_id"
  add_index "items", ["subcategory_id"], :name => "index_items_on_subcategory_id"
  add_index "items", ["unit_id"], :name => "index_items_on_unit_id"

  create_table "purchase_items", :force => true do |t|
    t.integer  "purchase_id"
    t.integer  "item_id"
    t.integer  "unit_id"
    t.float    "unit_cost"
    t.float    "quantity"
    t.float    "amount"
    t.text     "vat_type"
    t.string   "particulars"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "purchase_items", ["item_id"], :name => "index_purchase_items_on_item_id"
  add_index "purchase_items", ["purchase_id"], :name => "index_purchase_items_on_purchase_id"

  create_table "purchases", :force => true do |t|
    t.integer  "supplier_id"
    t.integer  "branch_id"
    t.integer  "concept_id"
    t.integer  "client_id"
    t.integer  "creator_id"
    t.integer  "purchase_date"
    t.string   "invoice_number"
    t.text     "vat_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "purchases", ["branch_id"], :name => "index_purchases_on_branch_id"
  add_index "purchases", ["client_id"], :name => "index_purchases_on_client_id"
  add_index "purchases", ["concept_id"], :name => "index_purchases_on_concept_id"
  add_index "purchases", ["creator_id"], :name => "index_purchases_on_creator_id"
  add_index "purchases", ["supplier_id"], :name => "index_purchases_on_supplier_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "client_id"
    t.integer  "concept_id"
    t.integer  "branch_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "roles", ["branch_id"], :name => "index_roles_on_branch_id"
  add_index "roles", ["client_id"], :name => "index_roles_on_client_id"
  add_index "roles", ["concept_id"], :name => "index_roles_on_concept_id"

  create_table "subcategories", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "category_id"
    t.integer  "client_id"
    t.integer  "concept_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "subcategories", ["category_id"], :name => "index_subcategories_on_category_id"
  add_index "subcategories", ["client_id"], :name => "index_subcategories_on_client_id"
  add_index "subcategories", ["concept_id"], :name => "index_subcategories_on_concept_id"

  create_table "suppliers", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "email"
    t.string   "contact_person"
    t.string   "contact_number"
    t.string   "contact_title"
    t.string   "tin"
    t.text     "description"
    t.integer  "client_id"
    t.integer  "concept_id"
    t.integer  "branch_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "suppliers", ["branch_id"], :name => "index_suppliers_on_branch_id"
  add_index "suppliers", ["client_id"], :name => "index_suppliers_on_client_id"
  add_index "suppliers", ["concept_id"], :name => "index_suppliers_on_concept_id"

  create_table "units", :force => true do |t|
    t.string   "name"
    t.string   "symbol"
    t.string   "unit_type"
    t.integer  "branch_id"
    t.integer  "concept_id"
    t.integer  "client_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "units", ["branch_id"], :name => "index_units_on_branch_id"
  add_index "units", ["client_id"], :name => "index_units_on_client_id"
  add_index "units", ["concept_id"], :name => "index_units_on_concept_id"

end
