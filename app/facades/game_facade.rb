# frozen_string_literal: true

class GameFacade
  def self.create_game(set, player_one_uuid)
    game = Game.create
    game.players.create(uuid: player_one_uuid)
    # Game.create(player_one_uuid: player_one_uuid)
  end
end
