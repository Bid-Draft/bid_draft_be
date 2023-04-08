# frozen_string_literal: true

class AddGameToCard < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :game_id, :integer
    add_index  :cards, :game_id
  end
end
