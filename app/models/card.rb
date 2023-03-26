class Card < ApplicationRecord
    may_belongs_to :player
    # belongs_to :game
    has_many :bids
end