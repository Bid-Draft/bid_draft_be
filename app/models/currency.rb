# frozen_string_literal: true

class Currency < ApplicationRecord
  belongs_to :game
  belongs_to :player
end
