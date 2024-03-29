# frozen_string_literal: true

class Player < ApplicationRecord
  has_and_belongs_to_many :games
  has_many :cards
  has_many :currencies
  has_many :bids
end
