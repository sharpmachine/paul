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

ActiveRecord::Schema.define(:version => 20120910012718) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "posts_count", :default => 0
    t.string   "slug"
  end

  add_index "categories", ["id"], :name => "index_categories_on_id", :unique => true
  add_index "categories", ["slug"], :name => "index_categories_on_slug", :unique => true

  create_table "events", :force => true do |t|
    t.string   "organization"
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "organization_address"
    t.string   "organization_address2"
    t.string   "organization_city"
    t.string   "organization_state"
    t.string   "organization_zip"
    t.string   "organization_country"
    t.string   "url"
    t.string   "event_type"
    t.text     "theme"
    t.date     "starts_at"
    t.date     "ends_at"
    t.integer  "estimated_attendance"
    t.string   "other_speakers"
    t.boolean  "budget_for_additional_traveller"
    t.string   "housing"
    t.boolean  "bethel_students"
    t.integer  "bethel_students_total"
    t.boolean  "bethel_student_housing"
    t.string   "location_name"
    t.string   "address"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.text     "information"
    t.string   "airport"
    t.string   "status",                          :default => "new"
    t.datetime "created_at",                                         :null => false
    t.datetime "updated_at",                                         :null => false
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.string   "slug"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pictures", :force => true do |t|
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "title"
    t.text     "description"
    t.boolean  "published",          :default => false
    t.string   "slug"
  end

  add_index "pictures", ["slug"], :name => "index_pictures_on_slug", :unique => true

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "category_id"
    t.boolean  "published",   :default => false
    t.string   "slug"
    t.integer  "picture_id"
  end

  add_index "posts", ["id"], :name => "index_posts_on_id", :unique => true
  add_index "posts", ["slug"], :name => "index_posts_on_slug", :unique => true

  create_table "products", :force => true do |t|
    t.string   "title"
    t.string   "author"
    t.text     "description"
    t.string   "url"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "product_type"
    t.string   "slug"
    t.boolean  "featured",           :default => false, :null => false
    t.text     "short_description"
  end

  add_index "products", ["slug"], :name => "index_products_on_slug", :unique => true

  create_table "tags", :force => true do |t|
    t.string   "tagstring"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "posts_count", :default => 0
  end

  add_index "tags", ["id"], :name => "index_tags_on_id", :unique => true

  create_table "tagships", :force => true do |t|
    t.integer "post_id"
    t.integer "tag_id"
  end

  add_index "tagships", ["post_id"], :name => "index_tagships_on_post_id"
  add_index "tagships", ["tag_id"], :name => "index_tagships_on_tag_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",     :null => false
    t.string   "encrypted_password",     :default => "",     :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "role",                   :default => "user"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.string   "slug"
    t.text     "description"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["slug"], :name => "index_users_on_slug", :unique => true

end
