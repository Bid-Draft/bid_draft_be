# frozen_string_literal: true

class AddBidToCards < ActiveRecord::Migration[5.2]
  def change
    add_column :bids, :card_id, :integer
    add_index  :bids, :card_id
    add_column :cards, :bid_id, :integer
    add_index  :cards, :bid_id
  end
end
