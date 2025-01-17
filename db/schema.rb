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

ActiveRecord::Schema.define(version: 2019_03_25_195955) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "ctoken"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "identity"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "consultants", force: :cascade do |t|
    t.bigint "client_id"
    t.bigint "contractor_id"
    t.bigint "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_consultants_on_client_id"
    t.index ["contractor_id"], name: "index_consultants_on_contractor_id"
    t.index ["employee_id"], name: "index_consultants_on_employee_id"
  end

  create_table "contractors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.bigint "partner_company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["partner_company_id"], name: "index_contractors_on_partner_company_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "identifier"
    t.string "first_name"
    t.string "last_name"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_employees_on_company_id"
  end

  create_table "partner_companies", force: :cascade do |t|
    t.string "identity"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "consultants", "clients"
  add_foreign_key "consultants", "contractors"
  add_foreign_key "consultants", "employees"
  add_foreign_key "contractors", "partner_companies"
  add_foreign_key "employees", "companies"
end
