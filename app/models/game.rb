class Game < ApplicationRecord
  has_many :cards
  has_many :players
  before_create :code_create

  def code_create
      if self.code == nil
        self.code = (0...6).map { (65 + rand(26)).chr }.join
      end
    end
end