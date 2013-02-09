class BillingPeriodsController < ApplicationController
  before_filter :fetch_billing_periods

  def index

  end

  def new
  end

  def edit
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
