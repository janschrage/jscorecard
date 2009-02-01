# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090201122826) do

  create_table "achievements", :force => true do |t|
    t.integer  "kpi_id"
    t.date     "report_date"
    t.decimal  "kpivalue",    :precision => 8, :scale => 2, :default => 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "audit_trails", :force => true do |t|
    t.integer  "record_id"
    t.string   "record_type"
    t.string   "event"
    t.integer  "user_id"
    t.datetime "created_at"
  end

  create_table "kpis", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "target_id"
    t.boolean  "bigger_is_better"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kpitargets", :force => true do |t|
    t.integer  "kpi_id"
    t.date     "begda"
    t.date     "endda"
    t.decimal  "target_value",          :precision => 8, :scale => 2, :default => 0.0
    t.boolean  "include_in_evaluation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "perspectives", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rights", :force => true do |t|
    t.string   "name"
    t.string   "controller"
    t.string   "action"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rights_roles", :id => false, :force => true do |t|
    t.integer  "right_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer  "role_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "targets", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "perspective_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
