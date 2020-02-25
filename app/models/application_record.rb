# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.timestamp(key)
    define_method "#{key}_timestamp" do
      send(key).to_i
    end

    define_method "#{key}_timestamp=" do |value|
      send("#{key}=", value)
    end
  end
end
