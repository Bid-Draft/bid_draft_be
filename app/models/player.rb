class Player < ApplicationRecord
    has_many :cards
    belongs_to :game
    has_many :bids
end