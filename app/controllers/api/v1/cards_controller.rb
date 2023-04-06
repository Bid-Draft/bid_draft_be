class Api::V1::CardsController < ApplicationController
    def create
        set = params[:set]
        # cards = CardFacade.get_cards(set)
    end 

    def index
        game = Game.find(params[:id])
        cards = Game.find(params[:id]).cards
        currencies = CurrencyFacade.get_currency(params[:id])

        render json: CardSerializer.format_cards(cards.order("id ASC")[game.cards_handled..game.cards_handled+2],game, currencies)   
    end

end