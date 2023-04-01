class Api::V1::BidsController < ApplicationController
    def create
       data = JSON.parse(request.raw_post)
       bid_data = BidFacade.create_bid(data)
       render json: BidSerializer.serialize(bid_data), status: :ok
    end 
    
    def index
        data = params[:game_id]
        bid_data = BidFacade.check_bids(data)
        render json: BidSerializer.serialize(bid_data), status: :ok
    end
end