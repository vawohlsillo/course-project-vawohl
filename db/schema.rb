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

ActiveRecord::Schema.define(version: 2019_06_21_185635) do

  create_table "blacklists", force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_blacklists_on_post_id"
    t.index ["user_id"], name: "index_blacklists_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_id"
    t.integer "inappropiate_comment_id"
    t.text "description"
    t.integer "inappropiate_counter"
    t.boolean "hide"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inappropiate_comment_id"], name: "index_comments_on_inappropiate_comment_id"
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "dumpsters", force: :cascade do |t|
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_dumpsters_on_post_id"
  end

  create_table "inappropiate_comments", force: :cascade do |t|
    t.string "justification"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inappropiate_posts", force: :cascade do |t|
    t.string "justification"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "inappropiate_post_id"
    t.string "title"
    t.text "description"
    t.integer "like"
    t.integer "unlike"
    t.boolean "solve_status"
    t.boolean "hide"
    t.integer "inappropiate_counter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inappropiate_post_id"], name: "index_posts_on_inappropiate_post_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.integer "blacklist_id"
    t.string "name"
    t.text "biography"
    t.string "sex"
    t.boolean "suspended"
    t.string "role"
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blacklist_id"], name: "index_users_on_blacklist_id"
  end

end
