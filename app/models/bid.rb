# frozen_string_literal: true

class Bid < ApplicationRecord
  belongs_to :player
  belongs_to :card
end
