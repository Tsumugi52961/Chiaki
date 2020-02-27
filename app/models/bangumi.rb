# frozen_string_literal: true

class Bangumi < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :link, presence: true
  validates :magnet_link, presence: true

  belongs_to :subscription
  delegate :name, to: :subscription

  timestamp :published_at
end
