# frozen_string_literal: true

class AddGamesToPlayer < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :game_id, :integer
    add_index  :players, :game_id
  end
end
