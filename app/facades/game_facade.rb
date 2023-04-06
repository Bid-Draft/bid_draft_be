class GameFacade
    def self.create_game(set,player_one_uuid)
       game = Game.create(player_one_uuid: player_one_uuid)
       return game
    end
  end