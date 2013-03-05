require 'spec_helper'

describe BillingPeriodRange do
  it "is valid with the default factory" do
    period = build(:billing_period_range)
    period.should be_valid
  end

  it "is invalid if the begin_date is more than the end_date" do
    billing_period = build :billing_period_range, begin_date: 15, end_date: 1

    billing_period.should_not be_valid
  end

  it "is valid if the end_date is less -1" do
    billing_period = build :billing_period_range, begin_date: 1, end_date: -1

    billing_period.should be_valid
  end

  context ".check_coverage" do
    let(:user) { create :user }

    it "returns true if billing periods adequately cover the entire month" do
      first_billing_period = create :billing_period_range, begin_date: 1, end_date: 15, user: user
      last_billing_period = create :billing_period_range, begin_date: 16, end_date: -1, user: user

      BillingPeriodRange.check_coverage(user).should be_true
    end

    it "raises a GapInCoverageError if billing periods do not cover the entire month" do
      first_billing_period = create :billing_period_range, begin_date: 1, end_date: 15, user:user
      second_billing_period = create :billing_period_range, begin_date: 16, end_date: 18, user:user

      expect { BillingPeriodRange.check_coverage(user) }.to raise_error BillingPeriodRange::GapInCoverageError
    end

    it "raises an OverlappingCoverageError if any of the user's billing periods overlap" do
      first_billing_period = create :billing_period_range, begin_date: 1, end_date: 15, user:user
      second_billing_period = create :billing_period_range, begin_date: 15, end_date: -1, user:user

      expect { BillingPeriodRange.check_coverage(user) }.to raise_error BillingPeriodRange::OverlappingCoverageError
    end
  end
end
