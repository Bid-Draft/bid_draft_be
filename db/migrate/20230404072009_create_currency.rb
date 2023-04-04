class CreateCurrency < ActiveRecord::Migration[5.2]
  def change
    create_table :currencies do |t|
      # add_column :currencies, :player_id, :integer
      # add_index  :currencies, :player_id
      # add_column :currencies, :game_id, :integer
      # add_index  :currencies, :game_id
      t.integer :value, default: 300
    end
  end
end
