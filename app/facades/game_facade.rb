# frozen_string_literal: true

class GameFacade
  def self.create_game(set, player_one_uuid)
    game = Game.create
    player = Player.find_or_create_by(uuid: player_one_uuid)
    Game.create(player_one_uuid: player_one_uuid)
  end

  def self.game_over?(game)
    if game.cards_handled == 90
      return true
    end
  end
end
