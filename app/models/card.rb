class Card < ApplicationRecord
    belongs_to :game
    belongs_to :player
    has_many :bids

    def tied_bids?
        if self.bids.order("value DESC").first.value == self.bids.order("value DESC").last.value
            return true
        end
    end

    def highest_bidder
        self.bids.order("value DESC").first.player
    end
    
    def lowest_bidder
        self.bids.order("value DESC").last.player
    end
    
    def lowest_bid
        self.bids.order("value DESC").last.value
    end
    
    def highest_bid
        self.bids.order("value DESC").first.value
    end
end