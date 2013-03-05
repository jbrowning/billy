require 'spec_helper'

describe BillingSchedule do
  let(:billing_schedule) { create :billing_schedule }

  it "is valid with default factory" do
    billing_schedule.should be_valid
  end

  it 'validates the presence of billing_period_range' do
    billing_schedule.billing_period_range = nil
    billing_schedule.should_not be_valid
  end
  
  it 'validates the presence of name' do
    billing_schedule.name = nil
    billing_schedule.should_not be_valid
  end
end
