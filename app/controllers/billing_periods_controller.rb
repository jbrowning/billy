class BillingPeriodsController < ApplicationController
  before_filter :fetch_billing_periods

  def index
    @new_bp = BillingPeriod.new
  end

  def create
  end

  def destroy
  end


private
  def fetch_billing_periods
    @billing_periods = current_user.billing_periods
  end

end
