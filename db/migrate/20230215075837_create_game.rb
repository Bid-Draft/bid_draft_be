# frozen_string_literal: true

class CreateGame < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :code
      t.integer :cards_handled, default: 0
      t.string :player_one_uuid
      t.string :player_two_uuid
    end
  end
end
