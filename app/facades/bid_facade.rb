# frozen_string_literal: true

class BidFacade
  def self.create_bid(data)
    game = Game.find(data['gameId'])
    player = Player.find_or_create_by(uuid: data['uuid'])
    player.games << game unless player.games.ids.include?(game.id)
    bid1 = Bid.create!(card_id: data['card1Id'], player_id: player.id, value: data['bid1'])
    bid2 = Bid.create!(card_id: data['card2Id'], player_id: player.id, value: data['bid2'])
    bid3 = Bid.create!(card_id: data['card3Id'], player_id: player.id, value: data['bid3'])
    if game.cards[game.cards_handled + 2].bids.length < 2
      { complete: false }
    else
      bids = BidFacade.bid_resolve(game)
      { complete: true, bids: bids }
    end
  end

  def self.bid_resolve(game)
    completed_bids = []
    game.cards[game.cards_handled..game.cards_handled + 2].each do |card|
      unless card.tied_bids?
        card.highest_bidder.cards << card
        player = card.highest_bidder
        currency = player.currencies.find_by(game_id: game.id)
        currency.value -= card.highest_bid
        currency.save
      end
      completed_bid = CompletedBid.new(winner_uuid: card.highest_bidder.uuid,
                                       loser_uuid: card.lowest_bidder.uuid,
                                       winner_bid: card.highest_bid,
                                       loser_bid: card.lowest_bid,
                                       card_id: card.id)
      completed_bids.push(completed_bid)
    end
    game.cards_handled += 3
    game.save
    completed_bids
  end

  def self.check_bids(data, last_card)
    game = Game.find(data.to_i)
    if game.cards.find(last_card).bids.length < 2
      { complete: false }
    else
      bids = BidFacade.get_bids(game)
      { complete: true, bids: bids }
    end
  end

  def self.get_bids(game)
    completed_bids = []
    game.cards.order('id ASC')[game.cards_handled - 3..game.cards_handled - 1].each do |card|
      completed_bid = CompletedBid.new(
        card_id: card.id,
        winner_uuid: card.highest_bidder.uuid,
        loser_uuid: card.lowest_bidder.uuid,
        winner_bid: card.highest_bid,
        loser_bid: card.lowest_bid
      )
      completed_bids.push(completed_bid)
    end
    completed_bids
  end
end
