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

ActiveRecord::Schema.define(:version => 20130323043833) do

  create_table "billing_period_ranges", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "begin_date", :null => false
    t.integer  "end_date",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "bills", :force => true do |t|
    t.integer  "user_id",                                    :null => false
    t.string   "name",                                       :null => false
    t.integer  "amount_cents",            :default => 0,     :null => false
    t.date     "date_due"
    t.date     "date_paid"
    t.boolean  "settled",                 :default => false, :null => false
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.integer  "billing_period_range_id"
  end

  create_table "recurring_bills", :force => true do |t|
    t.integer  "user_id",                 :null => false
    t.string   "name",                    :null => false
    t.integer  "billing_period_range_id", :null => false
    t.integer  "amount_cents"
    t.integer  "due_day"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "name",                                   :null => false
    t.integer  "balance_cents",          :default => 0,  :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
