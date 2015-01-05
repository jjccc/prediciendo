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

ActiveRecord::Schema.define(:version => 20150105222800) do

  create_table "authors", :force => true do |t|
    t.string   "name",                      :null => false
    t.string   "title"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "successes",  :default => 0, :null => false
    t.integer  "attempts",   :default => 0, :null => false
    t.string   "image"
    t.integer  "mistakes",   :default => 0, :null => false
  end

  create_table "mails", :force => true do |t|
    t.string   "result"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "predictions", :force => true do |t|
    t.integer  "author_id",                     :null => false
    t.text     "description",                   :null => false
    t.text     "result"
    t.boolean  "is_pending",  :default => true, :null => false
    t.boolean  "is_success"
    t.date     "due_date",                      :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "tag",         :default => "",   :null => false
    t.string   "slug"
  end

  add_index "predictions", ["slug"], :name => "index_predictions_on_slug"

end
