# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Subscription, type: :model do
  context 'base' do
    before do
      @subscription = Subscription.create(name: '魔法少女小圆', rule: 'madoka')
    end

    it { expect(@subscription).to respond_to(:status) }
    it { expect(@subscription).to respond_to(:enabled?) }
    it { expect(@subscription).to respond_to(:disabled?) }
    it { expect(Subscription).to respond_to(:enabled) }
    it { expect(Subscription).to respond_to(:disabled) }
  end
end
