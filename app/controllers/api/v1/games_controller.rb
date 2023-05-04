# frozen_string_literal: true

module Api
  module V1
    class GamesController < ApplicationController
      def create
        set = params[:set]
        cards = CardFacade.get_cards(params[:set])
        player_one_uuid = params[:player_one_uuid]

        game = GameFacade.create_game(set, player_one_uuid)
        game.cards << cards
        render json: GameSerializer.serialize(game), status: :ok
      end

      def show
        game = Game.find_by_id(params[:id])

        render json: GameSerializer.serialize_cards(game), status: :ok
      end
    end
  end
end
