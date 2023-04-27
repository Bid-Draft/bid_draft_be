# frozen_string_literal: true

sets = ['MOM', 'ONE', 'BRO', 'DMU', 'SNC', 'NEO', 'VOW', 'MID', 'AFR', 'STX', 'KHM',     
'ZNR', 'IKO', 'M21', 'THB', 'ELD', 'M20', 'WAR', 'RNA', 'GRN', 'M19', 'DOM',     
'RIX', 'XLN', 'HOU', 'AKH', 'AER', 'KLD', 'EMN', 'SOI', 'OGW', 'BFZ', 'ORI',     
'DTK', 'FRF', 'KTK', 'M15', 'JOU', 'BNG', 'THS', 'M14', 'DGM', 'GTC', 'RTR',     
'M13', 'AVR', 'DKA', 'ISD', 'M12']

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
