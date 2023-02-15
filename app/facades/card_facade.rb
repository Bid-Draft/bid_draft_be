class CardFacade
    def self.get_cards(set)
        cards = []
        1.times do
        pack = CardService.get_cards(set)
        cards.push(pack[:cards])
        end
        save_cards(cards)
    end

    def self.save_cards(cards)
        cards.flatten.flatten.each do |card|
            Card.create(name: card[:name], image: card[:imageUrl], rarity: card[:rarity])
        end
    end
  
  end