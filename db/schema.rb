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

ActiveRecord::Schema[7.0].define(version: 2024_10_08_085515) do
  create_table "doctor_schedules", charset: "utf8mb3", force: :cascade do |t|
    t.datetime "start_at", null: false
    t.datetime "end_at", null: false
    t.integer "doctor_type_id", null: false
    t.bigint "doctor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_doctor_schedules_on_doctor_id"
  end

  create_table "doctors", charset: "utf8mb3", force: :cascade do |t|
    t.string "name", null: false
    t.integer "department_id", null: false
    t.integer "phone_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patient_schedules", charset: "utf8mb3", force: :cascade do |t|
    t.datetime "start_at", null: false
    t.datetime "end_at", null: false
    t.integer "patient_type_id", null: false
    t.bigint "patient_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_patient_schedules_on_patient_id"
  end

  create_table "patients", charset: "utf8mb3", force: :cascade do |t|
    t.integer "number", null: false
    t.string "name", null: false
    t.integer "gender_id", null: false
    t.date "birthday", null: false
    t.integer "department_id", null: false
    t.integer "ward_id", null: false
    t.bigint "doctor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_patients_on_doctor_id"
  end

  create_table "tasks", charset: "utf8mb3", force: :cascade do |t|
    t.boolean "completed", default: false, null: false
    t.integer "title_id", null: false
    t.integer "occupation_id", null: false
    t.string "name", null: false
    t.string "phone_number", null: false
    t.text "content", null: false
    t.bigint "doctor_id", null: false
    t.bigint "patient_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_tasks_on_doctor_id"
    t.index ["patient_id"], name: "index_tasks_on_patient_id"
  end

  add_foreign_key "doctor_schedules", "doctors"
  add_foreign_key "patient_schedules", "patients"
  add_foreign_key "patients", "doctors"
  add_foreign_key "tasks", "doctors"
  add_foreign_key "tasks", "patients"
end
