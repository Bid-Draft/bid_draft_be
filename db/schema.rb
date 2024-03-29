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

ActiveRecord::Schema[7.0].define(version: 2023_04_26_235143) do
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
    t.integer "game_id"
    t.integer "bid_id"
    t.integer "player_id"
    t.integer "order"
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

  create_table "seed_cards", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.string "rarity"
    t.string "set"
  end

end
