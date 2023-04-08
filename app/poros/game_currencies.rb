# frozen_string_literal: true

class GameCurrencies
  attr_reader :player_one_uuid, :player_one_currency, :player_two_uuid, :player_two_currency

  def initialize(data)
    @player_one_uuid = data[:player_one_uuid]
    @player_one_currency = data[:player_one_currency]
    @player_two_uuid = data[:player_two_uuid]
    @player_two_currency = data[:player_two_currency]
  end
end
