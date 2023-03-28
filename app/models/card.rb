class Card < ApplicationRecord
    belongs_to :game
    belongs_to :player
    has_many :bids

    def tied_bids?
        if game.cards[game.cards_handled..game.cards_handled+2].each
            return false
        end
    end

    def highest_bidder
        self.bids.order("value DESC").first.player
    end
end