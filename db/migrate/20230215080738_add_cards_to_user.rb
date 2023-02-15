class AddCardsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :card_id, :integer
    add_index  :players, :card_id
  end
end
