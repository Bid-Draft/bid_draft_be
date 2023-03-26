class CardFacade
    def self.get_cards(set,game_id)
        cards = []
        1.times do
        pack = CardService.get_cards(set)
        cards.push(pack[:cards])
        end
        save_cards(cards,game_id)
    end
    
    def self.get_cards_not_from_pack(game_id)
        cards = CardService.get_cards_not_from_pack
        save_cards_not_from_pack(cards,game_id)
    end

    def self.save_cards(cards,game_id)
        cards.flatten.flatten.each do |card|
        Card.create(name: card[:name], image: card[:imageUrl], rarity: card[:rarity], game_id: game_id)
        end
    end
  
    def self.save_cards_not_from_pack(cards,game_id)
        cards = cards[:cards]
        x = 0
        final_cards = []
        50.times do 
            final_cards.push(cards[x])
            x+=2
        end
        
        final_cards.flatten.flatten.each do |card|
        Card.create(name: card[:name], image: card[:imageUrl], rarity: card[:rarity], game_id: game_id)
        end
    end

  end