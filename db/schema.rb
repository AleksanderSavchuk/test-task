# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_24_074652) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "browsers", force: :cascade do |t|
    t.bigint "device_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["device_id"], name: "index_browsers_on_device_id"
  end

  create_table "devices", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "device_type", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_devices_on_user_id"
  end

  create_table "mobile_phones", force: :cascade do |t|
    t.bigint "device_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["device_id"], name: "index_mobile_phones_on_device_id"
  end

  create_table "sensor_checks", force: :cascade do |t|
    t.bigint "tablet_id"
    t.integer "sensor_type_id"
    t.string "value"
    t.datetime "time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tablet_id"], name: "index_sensor_checks_on_tablet_id"
  end

  create_table "tablets", force: :cascade do |t|
    t.bigint "device_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["device_id"], name: "index_tablets_on_device_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users_devices", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "device_id"
    t.index ["device_id"], name: "index_users_devices_on_device_id"
    t.index ["user_id"], name: "index_users_devices_on_user_id"
  end

  add_foreign_key "browsers", "devices"
  add_foreign_key "devices", "users"
  add_foreign_key "mobile_phones", "devices"
  add_foreign_key "sensor_checks", "tablets"
  add_foreign_key "tablets", "devices"
end
