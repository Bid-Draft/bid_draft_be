class CreateGame < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :code
      t.integer :cards_handled, default: 0
      t.integer :last_card_id_sent
      t.integer :times_last_card_sent
    end
  end
end
