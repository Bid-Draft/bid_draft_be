# frozen_string_literal: true

class Game < ApplicationRecord
  has_many :cards
  has_and_belongs_to_many :players
  before_create :code_create

  def card_create
    Card.create(image: 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=130550&type=card',
                game_id: id, name: 'card1')
    Card.create(image: 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129465&type=card',
                game_id: id, name: 'card2')
    Card.create(image: 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129710&type=card',
                game_id: id, name: 'card3')
    Card.create(image: 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129711&type=card',
                game_id: id, name: 'card4')
    Card.create(image: 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129470&type=card',
                game_id: id, name: 'card5')
    Card.create(image: 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129477&type=card',
                game_id: id, name: 'card6')
  end

  def code_create
    return unless code.nil?

    self.code = (0...6).map { rand(65..90).chr }.join
  end

  def last_card
    cards.order('id DESC').first
  end
end
