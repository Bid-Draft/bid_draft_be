# frozen_string_literal: true

class GameSerializer
  def self.serialize(game)
    {
      "id": game.id
    }
  end
end
