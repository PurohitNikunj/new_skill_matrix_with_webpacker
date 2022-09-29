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

ActiveRecord::Schema[7.0].define(version: 2022_09_27_195743) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "departments", force: :cascade do |t|
    t.string "department_name", default: "", null: false
    t.integer "team_manager_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "skill_sets", force: :cascade do |t|
    t.string "skill_name", null: false
    t.bigint "tech_stack_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "department_id", null: false
    t.index ["department_id"], name: "index_skill_sets_on_department_id"
    t.index ["tech_stack_id"], name: "index_skill_sets_on_tech_stack_id"
  end

  create_table "sub_skill_sets", force: :cascade do |t|
    t.string "sub_skill_name", null: false
    t.bigint "skill_set_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["skill_set_id"], name: "index_sub_skill_sets_on_skill_set_id"
  end

  create_table "tech_stacks", force: :cascade do |t|
    t.string "stack_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_skills", force: :cascade do |t|
    t.integer "proficiency", null: false
    t.integer "skill_type", null: false
    t.integer "status", default: 0, null: false
    t.date "starting_date", null: false
    t.date "last_used_date", null: false
    t.bigint "user_id", null: false
    t.bigint "skill_set_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["skill_set_id"], name: "index_user_skills_on_skill_set_id"
    t.index ["user_id"], name: "index_user_skills_on_user_id"
  end

  create_table "user_sub_skills", force: :cascade do |t|
    t.integer "proficiency", null: false
    t.integer "status", default: 0, null: false
    t.date "starting_date", null: false
    t.date "last_used_date", null: false
    t.bigint "user_skill_id", null: false
    t.bigint "sub_skill_set_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sub_skill_set_id"], name: "index_user_sub_skills_on_sub_skill_set_id"
    t.index ["user_skill_id"], name: "index_user_sub_skills_on_user_skill_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "phone_number", null: false
    t.string "email", null: false
    t.integer "designation", null: false
    t.date "career_start_date", null: false
    t.integer "drop_in_career", null: false
    t.text "about", null: false
    t.integer "role", null: false
    t.bigint "department_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_users_on_department_id"
  end

  add_foreign_key "skill_sets", "departments"
  add_foreign_key "skill_sets", "tech_stacks"
  add_foreign_key "sub_skill_sets", "skill_sets"
  add_foreign_key "user_skills", "skill_sets"
  add_foreign_key "user_skills", "users"
  add_foreign_key "user_sub_skills", "sub_skill_sets"
  add_foreign_key "user_sub_skills", "user_skills"
  add_foreign_key "users", "departments"
end
