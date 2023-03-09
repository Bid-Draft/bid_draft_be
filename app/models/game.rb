class Game < ApplicationRecord
  has_many :cards
  has_many :players
  before_create :code_create
  after_create :player_create

  def player_create
    Player.create(game_id: self.id)
    Player.create(game_id: self.id)
  end

  def code_create
      if self.code == nil
        self.code = (0...6).map { (65 + rand(26)).chr }.join
      end
    end
end