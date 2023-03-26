class BidFacade
    def self.create_bid(data)
        game = Game.find(data["gameId"])
        player = Player.find_or_create_by(uuid: data["uuid"], game_id: game.id)
        bid1 = Bid.create!(card_id: game.cards[0].id, player_id: player.id, value: data["bid1"])
        bid2 = Bid.create!(card_id: game.cards[1].id, player_id: player.id, value: data["bid2"])
        bid3 = Bid.create!(card_id: game.cards[2].id, player_id: player.id, value: data["bid3"])
        if game.cards[0].bids.length > 1
            BidFacade.bid_resolve(game)
        end
    end

    def self.bid_resolve(game)
        game.cards[0..1].each do |card|
            if card.bids.order("value DESC").first == card.bids.order("value DESC").last
                card.delete
            else 
        end
    end

end