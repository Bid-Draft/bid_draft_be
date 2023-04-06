class Api::V1::PlayersController < ApplicationController
    def create
        game = Game.find(params[:game_id])
        unless game.player_one_uuid == params[:uuid]
            game.player_two_uuid = params[:uuid]
            game.save
        end
    end 

end