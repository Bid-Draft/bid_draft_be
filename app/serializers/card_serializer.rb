class CardSerializer
    def self.format_cards(cards)
    {
      cards: {
        cards.map do |card|
            {
                name: card.name,
                image: card.image
            }
        end
    }
}
end