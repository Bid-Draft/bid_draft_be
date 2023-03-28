class Api::V1::CardsController < ApplicationController
    def create
        set = params[:set]
        # cards = CardFacade.get_cards(set)
    end 

    def index
        game = Game.find(params[:id])
        cards = Game.find(params[:id]).cards

        render json: CardSerializer.format_cards(cards[game.cards_handled..game.cards_handled+2],game)   
    end

end