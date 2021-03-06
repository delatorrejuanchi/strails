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

ActiveRecord::Schema.define(version: 2018_11_05_234428) do

  create_table "strails_option_types", force: :cascade do |t|
    t.string "name"
    t.string "presentation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "strails_option_value_variants", force: :cascade do |t|
    t.integer "option_value_id"
    t.integer "variant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["option_value_id"], name: "index_strails_option_value_variants_on_option_value_id"
    t.index ["variant_id"], name: "index_strails_option_value_variants_on_variant_id"
  end

  create_table "strails_option_values", force: :cascade do |t|
    t.string "name"
    t.string "presentation"
    t.integer "option_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["option_type_id"], name: "index_strails_option_values_on_option_type_id"
  end

  create_table "strails_products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "strails_variants", force: :cascade do |t|
    t.string "sku"
    t.decimal "price", precision: 10, scale: 2
    t.boolean "is_master"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_strails_variants_on_product_id"
  end

end
