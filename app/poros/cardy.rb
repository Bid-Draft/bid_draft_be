# frozen_string_literal: true

class Cardy
  attr_reader :image, :name, :rarity, :color

  def initialize(data)
    @name = data[:name]
    @image = data[:imageUrl]
    @rarity = data[:rarity]
    Card.new(name: @name, image: @image, rarity: @rarity)
  end
end
