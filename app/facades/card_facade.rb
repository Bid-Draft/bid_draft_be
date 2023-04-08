# frozen_string_literal: true

class CardFacade
  def self.get_cards(_set)
    cards = []
    SeedCard

    commons = SeedCard.where(set: 'RTR').where(rarity: 'common')
    11.times do
      seed = commons.order('RANDOM()').first
      card = Card.create(name: seed.name, image: seed.image)
      cards << card
    end
    uncommons = SeedCard.where(set: 'RTR').where(rarity: 'uncommon')
    3.times do
      seed = uncommons.order('RANDOM()').first
      card = Card.create(name: seed.name, image: seed.image)
      cards << card
    end
    rares = SeedCard.where(set: 'RTR').where(rarity: %w[rare mythic])
    seed = rares.order('RANDOM()').first
    card = Card.create(name: seed.name, image: seed.image)
    cards << card
    cards.shuffle
    cards
  end
end
