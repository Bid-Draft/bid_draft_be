# frozen_string_literal: true

class AddPlayersAndCardsToGame < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :card_id, :integer
    add_index  :games, :card_id
    add_column :games, :player_id, :integer
    add_index  :games, :player_id
  end
end
