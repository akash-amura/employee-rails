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

ActiveRecord::Schema.define(version: 20160826130900) do

  create_table "addresses", force: :cascade do |t|
    t.string  "city"
    t.string  "street_name"
    t.string  "street_address"
    t.string  "secondary_address"
    t.string  "building_number"
    t.integer "zip_code",          limit: 8
    t.string  "state"
    t.string  "country"
    t.float   "latitude"
    t.float   "longitude"
    t.string  "addressable_id"
    t.string  "addressable_type"
  end

  add_index "addresses", ["addressable_id"], name: "index_addresses_on_addressable_id"

  create_table "companies", id: false, force: :cascade do |t|
    t.string "company_id",   null: false
    t.string "name"
    t.string "domain"
    t.string "company_type"
    t.text   "description"
  end

  add_index "companies", ["company_id"], name: "index_companies_on_company_id", unique: true

  create_table "employees", id: false, force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "employee_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "company_id"
    t.float    "salary"
    t.string   "designation"
  end

  add_index "employees", ["company_id"], name: "index_employees_on_company_id"
  add_index "employees", ["employee_id"], name: "index_employees_on_employee_id", unique: true

end
