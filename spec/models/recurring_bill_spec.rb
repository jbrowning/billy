require 'spec_helper'

describe RecurringBill do
  let(:recurring_bill) { create :recurring_bill }

  it "is valid with default factory" do
    recurring_bill.should be_valid
  end

  it 'validates the presence of billing_period_range' do
    recurring_bill.billing_period_range = nil
    recurring_bill.should_not be_valid
  end
  
  it 'validates the presence of name' do
    recurring_bill.name = nil
    recurring_bill.should_not be_valid
  end
end
