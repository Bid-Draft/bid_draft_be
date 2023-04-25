# frozen_string_literal: true

module Api
  module V1
    class PlayersController < ApplicationController
      def create
        game = Game.find(params[:game_id])
        return if game.player_one_uuid == params[:uuid]

        game. = params[:uuid]
        game.save
      end
    end
  end
end
