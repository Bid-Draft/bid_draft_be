# frozen_string_literal: true

class Game < ApplicationRecord
  has_many :cards
  has_and_belongs_to_many :players
  before_create :code_create

  def player_one
    self.players.where(uuid:self.player_one_uuid).first
  end
  def player_two
    self.players.where(uuid:self.player_two_uuid).first
  end

  def player_one_cards
    self.players.where(uuid:self.player_one_uuid).first.cards.where(game_id:self.id)
  end
  
  def player_two_cards
    self.players.where(uuid:self.player_two_uuid).first.cards.where(game_id:self.id)
  end

  def code_create
    return unless code.nil?

    self.code = (0...6).map { rand(65..90).chr }.join
  end

  def last_card
    self.cards.order('id DESC').first
  end
end
