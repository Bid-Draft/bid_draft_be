class Api::V1::GamesController < ApplicationController
    def create
        set = params[:set]
        player_one_uuid = params[:player_one_uuid]
        game = GameFacade.create_game(set,player_one_uuid)
        render json: GameSerializer.serialize(game), status: :ok
    end 

    def show
        game = Game.find_by_id(params[:id])
        
        render json: GameSerializer.serialize_cards(game), status: :ok
    end
end