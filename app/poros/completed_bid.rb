class CompletedBid
    attr_reader :winner_uuid, :loser_uuid, :winner_bid, :loser_bid
        def initialize(data)
                            if data[:loser_bid] == data[:winner_bid]
                                @tied = "true"
                            else
                                @tied = "false"
                            end
                            @winner_uuid = data[:winner_uuid] 
                            @loser_uuid = data[:loser_uuid] 
                            @winner_bid = data[:winner_bid] 
                            @loser_bid =  data[:loser_bid]
        end
    end