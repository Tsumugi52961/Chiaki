# frozen_string_literal: true

class CreateBangumis < ActiveRecord::Migration[5.2]
  def change
    create_table :bangumis do |t|
      t.string :title
      t.string :link
      t.string :magnet_link
      t.datetime :published_at

      t.timestamps
    end
  end
end
