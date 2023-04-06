class CreateCurrency < ActiveRecord::Migration[5.2]
  def change
    create_table :currencies do |t|
      t.integer :value, default: 300
    end
  end
end
