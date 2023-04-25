# frozen_string_literal: true

class CompletedBid
  attr_reader :winner_uuid, :loser_uuid, :winner_bid, :loser_bid, :tied, :card_id

  def initialize(data)
    @tied = if data[:loser_bid] == data[:winner_bid]
              'true'
            else
              'false'
            end
    @winner_uuid = data[:winner_uuid]
    @loser_uuid = data[:loser_uuid]
    @winner_bid = data[:winner_bid]
    @loser_bid =  data[:loser_bid]
    @card_id = data[:card_id]
  end
end
