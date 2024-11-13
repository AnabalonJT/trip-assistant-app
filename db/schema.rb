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

ActiveRecord::Schema[7.0].define(version: 2024_11_13_194220) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignation_to_buys", force: :cascade do |t|
    t.bigint "ingredient_id", null: false
    t.bigint "user_id", null: false
    t.bigint "trip_id", null: false
    t.boolean "verified"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id"], name: "index_assignation_to_buys_on_ingredient_id"
    t.index ["trip_id"], name: "index_assignation_to_buys_on_trip_id"
    t.index ["user_id"], name: "index_assignation_to_buys_on_user_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "trip_id", null: false
    t.decimal "amount"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_expenses_on_trip_id"
    t.index ["user_id"], name: "index_expenses_on_user_id"
  end

  create_table "forbidden_food_users", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "ingredient_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id"], name: "index_forbidden_food_users_on_ingredient_id"
    t.index ["user_id"], name: "index_forbidden_food_users_on_user_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipe_ingredients", force: :cascade do |t|
    t.bigint "recipe_id", null: false
    t.bigint "ingredient_id", null: false
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id"], name: "index_recipe_ingredients_on_ingredient_id"
    t.index ["recipe_id"], name: "index_recipe_ingredients_on_recipe_id"
  end

  create_table "recipe_trips", force: :cascade do |t|
    t.bigint "recipe_id", null: false
    t.bigint "trip_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_recipe_trips_on_recipe_id"
    t.index ["trip_id"], name: "index_recipe_trips_on_trip_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.integer "number_people"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trips", force: :cascade do |t|
    t.string "title"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_trips", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "trip_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_user_trips_on_trip_id"
    t.index ["user_id"], name: "index_user_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "assignation_to_buys", "ingredients"
  add_foreign_key "assignation_to_buys", "trips"
  add_foreign_key "assignation_to_buys", "users"
  add_foreign_key "expenses", "trips"
  add_foreign_key "expenses", "users"
  add_foreign_key "forbidden_food_users", "ingredients"
  add_foreign_key "forbidden_food_users", "users"
  add_foreign_key "recipe_ingredients", "ingredients"
  add_foreign_key "recipe_ingredients", "recipes"
  add_foreign_key "recipe_trips", "recipes"
  add_foreign_key "recipe_trips", "trips"
  add_foreign_key "user_trips", "trips"
  add_foreign_key "user_trips", "users"
end
