# frozen_string_literal: true

class Subscription < ApplicationRecord
  attribute :status, :integer, default: 0
  validates :name, presence: true, uniqueness: true
  enum status: %w[enabled disabled]
end
