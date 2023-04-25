# frozen_string_literal: true

class Card < ApplicationRecord
  belongs_to :game
  belongs_to :player
  has_many :bids

  def tied_bids?
    return unless bids.order('value DESC').first.value == bids.order('value DESC').last.value

    true
  end

  def highest_bidder
    bids.order('value DESC').first.player
  end

  def lowest_bidder
    bids.order('value DESC').last.player
  end

  def lowest_bid
    bids.order('value DESC').last.value
  end

  def highest_bid
    bids.order('value DESC').first.value
  end
end
