require 'spec_helper'

describe BalanceCalculator do
  let(:user) { build_stubbed :user, balance_cents: 10_00 }
  let(:calc) { BalanceCalculator.new(user) }
  
  describe '#account_balance' do
    it 'displays the currency with symbol' do
      calc.account_balance.should eql("$10.00")
    end
  end

  describe '#available_balance' do
    let!(:unsettled_bill) { create :bill, :unsettled, amount_cents: 3_00, user: user }

    it 'displays the correct balance with symbol' do
      calc.available_balance.should eql("$7.00")
    end
  end
end
