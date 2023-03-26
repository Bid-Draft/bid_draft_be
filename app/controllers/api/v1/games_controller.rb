class Api::V1::GamesController < ApplicationController
    def create
        set = params[:set]
        game = Game.create
        # # CardFacade.get_cards(set, game.id)
        # CardFacade.get_cards_not_from_pack(game.id)
        render json: GameSerializer.serialize(game), status: :ok
    end 

    def show
        game = Game.find_by_id(params[:id])
        
        render json: GameSerializer.serialize_cards(game), status: :ok
    end
end