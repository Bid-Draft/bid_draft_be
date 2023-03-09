class Api::V1::CardsController < ApplicationController
    def create
        set = params[:set]
        cards = CardFacade.get_cards(set)
    end 

    def index
        cards = Game.find(params[:game_id]).cards
        
        render json: CardSerializer.format_cards(cards[0..2])   
    end

end