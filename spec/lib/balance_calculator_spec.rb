require 'spec_helper'

describe BalanceCalculator do
  describe '#account_balance' do
    let(:user) { build_stubbed :user, balance_cents: 10_00 }
    let(:calc) { BalanceCalculator.new(user) }
    
    it 'displays the currency with symbol' do
      calc.account_balance.should eql("$10.00")
    end
  end
end
