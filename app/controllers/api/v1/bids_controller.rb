class Api::V1::BidsController < ApplicationController
    def create
       data = JSON.parse(request.raw_post)
       bid_data = BidFacade.create_bid(data)
       render json: BidSerializer.serialize(bid_data), status: :ok
    end 
    
    def index
        data = params[:game_id]
        last_card = params[:last_card]
        bid_data = BidFacade.check_bids(data, last_card)
        render json: BidSerializer.serialize(bid_data), status: :ok
    end
end