class Api::V1::BidsController < ApplicationController
    def create
        game = Game.find_by(param[:game_id])
        player = Player.find_by(params[:player_id])

        params[:bids].each do |bid|
            bid_handle(bid,player)
        end
    end 

    def bid_handle(bid, player)
       new_bid = Bid.create(value: bid.vaule, card_id: bid.card_id, player_id: player.id)
        if new_bid.card.bids.length == 2
            if
            card = Card.find(bid.card_id)
            card.player_id = player_id

    end