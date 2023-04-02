class BidFacade
    def self.create_bid(data)
        game = Game.find(data["gameId"])
        player = Player.find_or_create_by(uuid:data["uuid"])
        unless player.games.ids.include?(game.id)
           player.games << game
        end
        bid1 = Bid.create!(card_id: game.cards[game.cards_handled].id, player_id: player.id, value: data["bid1"])
        bid2 = Bid.create!(card_id: game.cards[game.cards_handled+1].id, player_id: player.id, value: data["bid2"])
        bid3 = Bid.create!(card_id: game.cards[game.cards_handled+2].id, player_id: player.id, value: data["bid3"])
        if game.cards[game.cards_handled].bids.length < 2
            return {complete: false }
        else 
            bids = BidFacade.bid_resolve(game)
             return {complete: true, bids: bids }
        end

    end

    def self.bid_resolve(game)
        completed_bids = []
        game.cards[game.cards_handled..game.cards_handled+2].each do |card|
            unless card.tied_bids?
                card.highest_bidder.cards << card
            end
            completed_bid = CompletedBid.new(winner_uuid:card.highest_bidder.uuid,
                                                loser_uuid: card.lowest_bidder.uuid,
                                                winner_bid: card.highest_bid,
                                                loser_bid: card.lowest_bid,
                                                card_id: card.id)
            completed_bids.push(completed_bid)                               
        end
        game.cards_handled += 3
        game.times_last_card_sent = 0
        game.save
        return completed_bids
    end

    def self.check_bids(data)
        game = Game.find(data.to_i)
        # if game.cards[game.cards_handled-1].id == game.last_card_id_sent && game.times_last_card_sent > 1 || game.cards[game.cards_handled-3].bids length < 2
        if game.cards[game.cards_handled-3].bids.length < 2
            return {complete: false }
        else 
            bids = BidFacade.get_bids(game)
            return {complete: true, bids: bids }
        end
    end

    def self.get_bids(game)
        completed_bids = []

        game.cards[game.cards_handled-3..game.cards_handled-1].each do |card|
            completed_bid = CompletedBid.new(
                                                card_id: card.id,
                                                winner_uuid:card.highest_bidder.uuid,
                                                loser_uuid: card.lowest_bidder.uuid,
                                                winner_bid: card.highest_bid,
                                                loser_bid: card.lowest_bid)
            completed_bids.push(completed_bid)                               
        end
        game.last_card_id_sent = completed_bids[2].card_id
        game.times_last_card_sent += 1
        game.save
        return completed_bids
    end


end