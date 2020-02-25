# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Bangumi, type: :model do
  context 'base' do
    before do
      @bangumi = Bangumi.new(title: 'title',
                             link: 'https://share.dmhy.org/',
                             magnet_link: 'magnet?:xt=urn:bithXH0131f3')
    end

    it { expect(@bangumi).to respond_to(:published_at_timestamp) }
  end
end
