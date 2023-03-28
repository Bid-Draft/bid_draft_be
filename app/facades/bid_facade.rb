class BidFacade
    def self.create_bid(data)
        game = Game.find(data["gameId"])
        player = Player.find_or_create_by(uuid:data["uuid"])
        unless player.games.ids.include?(game.id)
           player.games << game
        end
        bid1 = Bid.create!(card_id: game.cards[0].id, player_id: player.id, value: data["bid1"])
        bid2 = Bid.create!(card_id: game.cards[1].id, player_id: player.id, value: data["bid2"])
        bid3 = Bid.create!(card_id: game.cards[2].id, player_id: player.id, value: data["bid3"])
        if game.cards[0].bids.length > 1
            BidFacade.bid_resolve(game)
        end
    end

    def self.bid_resolve(game)
        game.cards[game.cards_handled..game.cards_handled+2].each do |card|
            unless card.tied_bids?
                card.highest_bidder.cards << card
            end
        end
        game.cards_handled+=3
    end

end