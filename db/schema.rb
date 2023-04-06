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

ActiveRecord::Schema.define(version: 2023_04_04_073240) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bids", force: :cascade do |t|
    t.integer "value"
    t.integer "card_id"
    t.integer "player_id"
    t.index ["card_id"], name: "index_bids_on_card_id"
    t.index ["player_id"], name: "index_bids_on_player_id"
  end

  create_table "cards", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.string "rarity"
    t.string "set"
    t.integer "game_id"
    t.integer "bid_id"
    t.integer "player_id"
    t.index ["bid_id"], name: "index_cards_on_bid_id"
    t.index ["game_id"], name: "index_cards_on_game_id"
    t.index ["player_id"], name: "index_cards_on_player_id"
  end

  create_table "currencies", force: :cascade do |t|
    t.integer "value", default: 300
    t.integer "player_id"
    t.integer "game_id"
    t.index ["game_id"], name: "index_currencies_on_game_id"
    t.index ["player_id"], name: "index_currencies_on_player_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "code"
    t.integer "cards_handled", default: 0
    t.string "player_one_uuid"
    t.string "player_two_uuid"
    t.integer "card_id"
    t.integer "player_id"
    t.index ["card_id"], name: "index_games_on_card_id"
    t.index ["player_id"], name: "index_games_on_player_id"
  end

  create_table "games_players", id: false, force: :cascade do |t|
    t.bigint "game_id", null: false
    t.bigint "player_id", null: false
    t.index ["game_id"], name: "index_games_players_on_game_id"
    t.index ["player_id"], name: "index_games_players_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "uuid"
    t.integer "game_id"
    t.integer "bid_id"
    t.integer "card_id"
    t.index ["bid_id"], name: "index_players_on_bid_id"
    t.index ["card_id"], name: "index_players_on_card_id"
    t.index ["game_id"], name: "index_players_on_game_id"
  end

end
