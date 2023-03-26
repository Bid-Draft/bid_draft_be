class GameSerializer
    def self.serialize(game)
        { 
            "id": game.id
        }
    end

    def self.serialize_cards(game)
        # {
        #     "cards": 
        #     game.cards[0,2,4].map do |card|
        #         {
        #             image
        #         }
        # }
    end
end