# frozen_string_literal: true

class AddBidToPlayer < ActiveRecord::Migration[5.2]
  def change
    add_column :bids, :player_id, :integer
    add_index  :bids, :player_id
    add_column :players, :bid_id, :integer
    add_index  :players, :bid_id
  end
end
