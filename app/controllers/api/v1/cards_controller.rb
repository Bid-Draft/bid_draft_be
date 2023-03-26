class Api::V1::CardsController < ApplicationController
    def create
        set = params[:set]
        # cards = CardFacade.get_cards(set)
    end 

    def index
        game = Game.find(params[:id])
        cards = Game.find(params[:id]).cards
        
        render json: CardSerializer.format_cards(cards[0..2],game)   
    end

end