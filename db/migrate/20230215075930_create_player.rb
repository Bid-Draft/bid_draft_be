class CreatePlayer < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :currency, default: 300
      t.string :uuid
    end
  end
end
