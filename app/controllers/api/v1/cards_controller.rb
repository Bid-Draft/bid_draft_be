# frozen_string_literal: true

module Api
  module V1
    class CardsController < ApplicationController
      def create
        set = params[:set]
        # cards = CardFacade.get_cards(set)
      end

      def index
        game = Game.find(params[:id])
        game_over = GameFacade.game_over?(game)
        cards = Game.find(params[:id]).cards
        currencies = CurrencyFacade.get_currency(params[:id])

        render json: CardSerializer.format_cards(cards.order('id ASC')[game.cards_handled..game.cards_handled + 2], game,
                                                 currencies,game_over)
      end
    end
  end
end
