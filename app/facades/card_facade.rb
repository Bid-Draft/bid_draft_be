# frozen_string_literal: true

class CardFacade
  def self.get_cards(set)
    cards = []
    SeedCard
    order = 1
    6.times do
      commons = SeedCard.where(set: set).where(rarity: 'common')
        commons.order('RANDOM()')[0..10].each do |seed|
        card = create_card(seed,order)
        order += 1
        cards << card
        end
      uncommons = SeedCard.where(set: set).where(rarity: 'uncommon')
        uncommons.order('RANDOM()')[0..2].each do |seed|
        card = create_card(seed,order)
        order += 1
        cards << card
      end
      seed = SeedCard.where(set: set).where(rarity: %w[rare mythic]).order('RANDOM()').first
      card = create_card(seed,order)
      order += 1
      cards << card
    end
    cards
  end

  def self.create_card(seed,order)
    Card.create(name: seed.name, image: seed.image, order: order)
  end
end
