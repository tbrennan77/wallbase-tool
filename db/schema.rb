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

ActiveRecord::Schema.define(:version => 20140722211509) do

  create_table "collection_sections", :force => true do |t|
    t.integer  "collection_id"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "collections", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.boolean  "icon_1"
    t.boolean  "icon_2"
    t.boolean  "icon_3"
    t.boolean  "icon_4"
    t.boolean  "icon_5"
    t.text     "collection_description"
  end

  create_table "color_palettes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "order_number"
  end

  create_table "colors", :force => true do |t|
    t.integer  "color_palette_id"
    t.string   "color_number"
    t.string   "name"
    t.string   "hex"
    t.string   "color_foundation"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.boolean  "selects"
  end

  create_table "opening_pages", :force => true do |t|
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "profile_color_palettes", :id => false, :force => true do |t|
    t.integer "profile_id",       :null => false
    t.integer "color_palette_id", :null => false
  end

  create_table "profiles", :force => true do |t|
    t.integer  "style_type_id"
    t.float    "size"
    t.string   "name"
    t.string   "uuid"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.string   "profile_image_file_name"
    t.string   "profile_image_content_type"
    t.integer  "profile_image_file_size"
    t.datetime "profile_image_updated_at"
    t.string   "corner_image_file_name"
    t.string   "corner_image_content_type"
    t.integer  "corner_image_file_size"
    t.datetime "corner_image_updated_at"
  end

  create_table "style_types", :force => true do |t|
    t.string   "name"
    t.integer  "collection_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "material",      :default => "", :null => false
  end

end
