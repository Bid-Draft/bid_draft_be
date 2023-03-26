class Api::V1::BidsController < ApplicationController
    def create
        data = JSON.parse(request.raw_post)
        BidFacade.create_bid(data)
        

        # params[:bids].each do |bid|
        #     bid_handle(bid,player)
        # end
    end 

    # def bid_handle(bid, player)
    #    new_bid = Bid.create(value: bid.vaule, card_id: bid.card_id, player_id: player.id)
    #     if new_bid.card.bids.length == 2
    #         if
    #         card = Card.find(bid.card_id)
    #         card.player_id = player_id
    #         end
    #     end 
    # end
end