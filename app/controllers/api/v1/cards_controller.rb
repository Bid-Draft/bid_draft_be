class Api::V1::CardsController < ApplicationController
    def index
        set = params[:set]
        cards = CardFacade.get_cards(set)
    end 
end