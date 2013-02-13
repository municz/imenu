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

ActiveRecord::Schema.define(:version => 20130129141229) do

  create_table "menu_restaurants", :id => false, :force => true do |t|
    t.integer "menu_id",       :null => false
    t.integer "restaurant_id", :null => false
    t.date    "date"
  end

  add_index "menu_restaurants", ["menu_id", "restaurant_id", "date"], :name => "index_menu_restaurants_on_menu_id_and_restaurant_id_and_date", :unique => true
  add_index "menu_restaurants", ["menu_id", "restaurant_id"], :name => "index_menu_restaurants_on_menu_id_and_restaurant_id"

  create_table "menus", :force => true do |t|
    t.string   "name"
    t.integer  "cenaStudent"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "menus", ["name"], :name => "index_menus_on_name", :unique => true

  create_table "restaurants", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "restaurants", ["name"], :name => "index_restaurants_on_name", :unique => true

end
