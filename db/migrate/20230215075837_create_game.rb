class CreateGame < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :code
      t.integer :cards_handled, default: 0
    end
  end
end
