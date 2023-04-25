# frozen_string_literal: true

class GamePlayer < ApplicationRecord
  belongs_to :book
  belongs_to :author
end
