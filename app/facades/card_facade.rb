class CardFacade
    def self.get_cards(set,game_id)
        cards = []
        1.times do
        pack = CardService.get_cards(set)
        cards.push(pack[:cards])
        end
        save_cards(cards,game_id)
    end

    def self.save_cards(cards,game_id)
        cards.flatten.flatten.each do |card|
        Card.create(name: card[:name], image: card[:imageUrl], rarity: card[:rarity], game_id: game_id)
        end
    end
  
  end