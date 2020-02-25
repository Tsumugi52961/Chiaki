# frozen_string_literal: true

class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.string :name
      t.string :rule
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
