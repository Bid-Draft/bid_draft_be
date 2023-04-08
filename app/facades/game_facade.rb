# frozen_string_literal: true

class GameFacade
  def self.create_game(_set, player_one_uuid)
    Game.create(player_one_uuid: player_one_uuid)
  end
end
