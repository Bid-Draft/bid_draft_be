class CardService
    def self.get_cards(set)
          response = Faraday.get("https://api.magicthegathering.io/v1/sets/#{set}/booster")
          JSON.parse(response.body, symbolize_names: true)
    end
  end