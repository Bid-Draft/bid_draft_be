class Game < ApplicationRecord
  has_many :cards
  has_and_belongs_to_many :players
  before_create :code_create
  after_create :card_create

  def card_create
    Card.create(image:"http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=130550&type=card", game_id: self.id)
    Card.create(image:"http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129465&type=card", game_id: self.id)
    Card.create(image:"http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129710&type=card", game_id: self.id)
    Card.create(image:"http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129711&type=card", game_id: self.id)
    Card.create(image:"http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129470&type=card", game_id: self.id)
    Card.create(image:"http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129477&type=card", game_id: self.id)
  end

  def code_create
      if self.code == nil
        self.code = (0...6).map { (65 + rand(26)).chr }.join
      end
    end
end