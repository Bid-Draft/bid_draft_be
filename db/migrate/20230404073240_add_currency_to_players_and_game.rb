class AddCurrencyToPlayersAndGame < ActiveRecord::Migration[5.2]
  def change
    add_column :currencies, :player_id, :integer
    add_index  :currencies, :player_id
    add_column :currencies, :game_id, :integer
    add_index  :currencies, :game_id
  end
end
