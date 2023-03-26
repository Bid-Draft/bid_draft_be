class CardSerializer
    def self.format_cards(cards,game)
    {
      "gameId": game.id,
      "cards": 
     
      cards.map do |card|
            {
                "id": card.id,
                "image": card.image
            }
        end
    
    }
end
end