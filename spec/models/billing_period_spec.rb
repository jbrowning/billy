require 'spec_helper'

describe BillingPeriod do
  it "validates uniqueness of begin date" do
    billing_period = create :billing_period

    invalid_period = build :billing_period,
                           user: billing_period.user,
                           begin_date: billing_period.begin_date

    expect(invalid_period).to_not be_valid
  end

  it "validates uniqueness of end date" do
    billing_period = create :billing_period

    invalid_period = build :billing_period,
                           user: billing_period.user,
                           end_date: billing_period.end_date

    expect(invalid_period).to_not be_valid
  end

  it "validates uniqueness of begin and end dates within scope of user" do
    user_1 = create :user
    user_2 = create :user

    user_1_billing_period = create :billing_period, user: user_1
    user_2_billing_period = build :billing_period,
                                   user: user_2,
                                   begin_date: user_1_billing_period.begin_date,
                                   end_date: user_1_billing_period.end_date

    expect(user_2_billing_period).to be_valid
  end
end
