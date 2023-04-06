class CurrencyFacade
    def self.get_currency(game_id)
        game = Game.find(game_id)
        player_one  = Player.find_or_create_by(uuid:game.player_one_uuid)
        player_one_currency = player_one.currencies.find_or_create_by(game_id:game_id).value 
        if game.player_two_uuid 
            player_two  = Player.find_or_create_by(uuid:game.player_two_uuid)
            player_two_currency = player_two.currencies.find_or_create_by(game_id:game_id).value
        else
            player_two_currency = 300
        end
       currencies = GameCurrencies.new(player_one_uuid: game.player_one_uuid, 
                        player_one_currency: player_one_currency,
                        player_two_uuid: game.player_two_uuid,
                        player_two_currency: player_two_currency)
        return currencies
    end
end