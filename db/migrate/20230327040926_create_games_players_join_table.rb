# frozen_string_literal: true

class CreateGamesPlayersJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :games, :players do |t|
      t.index :game_id
      t.index :player_id
    end
  end
end
