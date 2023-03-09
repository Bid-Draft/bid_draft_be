class Card < ApplicationRecord
    belongs_to :player
    belongs_to :card
end