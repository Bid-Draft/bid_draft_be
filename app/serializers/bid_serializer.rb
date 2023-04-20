# frozen_string_literal: true

class BidSerializer
  def self.serialize(data)
    
    {
      "complete": data[:complete].to_s,
      "draft_over": data[:draft_over],

      "bids":
        if data[:complete]
          data[:bids].map do |bid|
            {
              card_id: bid.card_id,
              tied: bid.tied,
              winner_uuid: bid.winner_uuid,
              loser_uuid: bid.loser_uuid,
              winner_bid: bid.winner_bid,
              loser_bid: bid.loser_bid
            }
          end
        else
          []
        end
    }
  end

  def self.serialize_index(data)
    {
      "complete": data[:complete]
    }
  end
end
