# frozen_string_literal: true

class CreatePlayer < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.string :uuid
    end
  end
end
