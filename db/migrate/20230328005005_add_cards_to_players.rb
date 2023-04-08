# frozen_string_literal: true

class AddCardsToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :player_id, :integer
    add_index  :cards, :player_id
    add_column :players, :card_id, :integer
    add_index  :players, :card_id
  end
end
