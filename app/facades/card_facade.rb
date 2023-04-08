class CardFacade
    def self.get_cards(set)
            cards = []
            SeedCard
        
        
        commons = SeedCard.where(set: "RTR").where(rarity:"common")
        11.times do
            seed = commons.order('RANDOM()').first
            card = Card.create(name:seed.name, image: seed.image)
            cards << card
        end
        uncommons = SeedCard.where(set: "RTR").where(rarity:"uncommon")
        3.times do
            seed = uncommons.order('RANDOM()').first
            card = Card.create(name:seed.name, image: seed.image)
            cards << card
        end
        rares = SeedCard.where(set: "RTR").where(rarity:["rare","mythic"])
        1.times do
            seed = rares.order('RANDOM()').first
            card = Card.create(name:seed.name, image: seed.image)
            cards << card
        end
        cards.shuffle
        return cards
    end
  end