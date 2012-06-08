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

ActiveRecord::Schema.define(:version => 20120608092650) do

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

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

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

end
