# frozen_string_literal: true

sets = ['RTR']
sets.each do |set|
  file = File.read("app/mtg_json/#{set}.json")
  data = JSON.parse(file)

  data['data']['cards'].each do |card|
    # http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=#{card["identifiers"]["multiverseId"]}&type=card
    SeedCard.create(
      image: "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=#{card['identifiers']['multiverseId']}&type=card", set: set, name: card['name'], rarity: card['rarity']
    )
  end
end
SeedCard.where(name: %w[Plains Island Swamp Forest Mountain]).destroy_all
