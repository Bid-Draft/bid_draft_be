class Api::V1::GamesController < ApplicationController
    def create
        set = params[:set]
        game = Game.create
        CardFacade.get_cards(set, game.id)
        render json: GameSerializer.serialize(game), status: :ok
    end 

    def show
        binding.pry
    end
end