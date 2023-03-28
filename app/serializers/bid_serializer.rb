class BidSerializer
    def self.serialize(data)
    {
      "complete": data[:complete].to_s,

      "bids": 
        if data[:complete]
      data[:bids].map do |bid|
            {   
                tied: bid.tied,
                winner_uuid:bid.winner_uuid, 
                loser_uuid:bid.loser_uuid, 
                winner_bid:bid.winner_bid, 
                loser_bid: bid.loser_bid
            }
            end
        else
            []
        end
    }
end
end