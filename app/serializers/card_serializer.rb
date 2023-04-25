# frozen_string_literal: true

class CardSerializer
  def self.format_cards(cards, game, currencies)
    {
      "gameId": game.id,
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
end
