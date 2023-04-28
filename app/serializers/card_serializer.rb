# frozen_string_literal: true

class CardSerializer
  def self.format_cards(cards, game, currencies,game_over)
    {
      "gameId": game.id,
      "gameOver": game_over,
      "cardsHandled": game.cards_handled,
      "currencies": {
        "player_one_uuid": currencies.player_one_uuid,
        "player_two_uuid": currencies.player_two_uuid,
        "player_one_currency": currencies.player_one_currency,
        "player_two_currency": currencies.player_two_currency
      },
      "cards":

      cards.map do |card|
        {
          "id": card.id,
          "image": card.image,
          "name": card.name
        }
      end
    }
  end
  def self.player_cards_serializer(game)
    {
      "player_one_uuid": game.player_one_uuid,
      "player_two_uuid": game.player_two_uuid,
      "player_one_cards": game.player_one_cards.map do |card|
        {
          "id": card.id,
          "image": card.image,
          "name": card.name
        }
      end,
      "player_two_cards": game.player_two_cards.map do |card|
        {
          "id": card.id,
          "image": card.image,
          "name": card.name
        }
      end
    }
  end
end
