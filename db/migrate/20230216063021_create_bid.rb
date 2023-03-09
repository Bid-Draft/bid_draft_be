class CreateBid < ActiveRecord::Migration[5.2]
  def change
    create_table :bids do |t|
      t.integer :value
    end
  end
end
