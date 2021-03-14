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

ActiveRecord::Schema.define(version: 2021_03_12_120444) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "price_dimensions", force: :cascade do |t|
    t.string "rate_code"
    t.string "description"
    t.string "begin_range"
    t.string "end_range"
    t.string "unit"
    t.string "region"
    t.date "effective_date"
    t.jsonb "price_per_unit"
    t.jsonb "applies_to", default: []
    t.bigint "term_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["term_id"], name: "index_price_dimensions_on_term_id"
  end

  create_table "pricing_lists", force: :cascade do |t|
    t.string "format_version"
    t.text "disclaimer"
    t.string "offer_code"
    t.string "version"
    t.datetime "publication_date"
    t.string "region"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "sku"
    t.string "product_family"
    t.string "service_code"
    t.string "location"
    t.string "location_type"
    t.string "usage_type"
    t.string "operation"
    t.string "request_description"
    t.string "request_type"
    t.string "service_name"
    t.bigint "pricing_list_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pricing_list_id"], name: "index_products_on_pricing_list_id"
  end

  create_table "terms", force: :cascade do |t|
    t.string "term_type"
    t.string "term_uid"
    t.string "offer_term_code"
    t.string "sku"
    t.datetime "effective_date"
    t.jsonb "term_attributes", default: "{}"
    t.bigint "pricing_list_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pricing_list_id"], name: "index_terms_on_pricing_list_id"
  end

  add_foreign_key "price_dimensions", "terms"
  add_foreign_key "products", "pricing_lists"
  add_foreign_key "terms", "pricing_lists"
end
