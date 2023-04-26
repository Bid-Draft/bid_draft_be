# frozen_string_literal: true

class GameFacade
  def self.create_game(_set, player_one_uuid)
    Game.create(player_one_uuid: player_one_uuid)
  end

  def self.game_over?(game)
    if game.cards_handled == 9
      return true
    end
  end
end
