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

ActiveRecord::Schema.define(:version => 20120319002814) do

  create_table "commedies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "image"
    t.string   "sector"
    t.string   "status"
    t.text     "memo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "company_person_employments", :force => true do |t|
    t.integer  "company_id"
    t.integer  "person_id"
    t.string   "summary"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "company_person_employments", ["company_id", "person_id"], :name => "index_company_person_employments_on_company_id_and_person_id"

  create_table "people", :force => true do |t|
    t.string   "title"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "homonymy"
    t.string   "image"
    t.string   "tax_code"
    t.boolean  "male"
    t.text     "memo"
    t.integer  "nationality_id"
    t.date     "born_date"
    t.integer  "born_city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "societies", :force => true do |t|
    t.string   "name"
    t.string   "image"
    t.string   "field"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_encrypted"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
