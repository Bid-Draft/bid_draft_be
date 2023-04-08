# frozen_string_literal: true

class CardService
  def self.get_cards(set)
    response = Faraday.get("https://api.magicthegathering.io/v1/sets/#{set}/booster")

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_cards_not_from_pack
    #     response = Faraday.get("https://api.magicthegathering.io/v1/sets/#{set}/booster")'
    response = Faraday.get('https://api.magicthegathering.io/v1/cards')
    JSON.parse(response.body, symbolize_names: true)
  end
end
