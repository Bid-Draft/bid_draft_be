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

ActiveRecord::Schema.define(version: 2023_02_15_080911) do

  create_table "cards", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.string "rarity"
    t.string "set"
  end

  create_table "games", force: :cascade do |t|
    t.string "code"
    t.integer "card_id"
    t.integer "player_id"
    t.index ["card_id"], name: "index_games_on_card_id"
    t.index ["player_id"], name: "index_games_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.integer "currency"
    t.integer "card_id"
    t.index ["card_id"], name: "index_players_on_card_id"
  end

end
