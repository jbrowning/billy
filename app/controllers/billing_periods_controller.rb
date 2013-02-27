class BillingPeriodsController < ApplicationController
  before_filter :fetch_billing_periods

  def index
    @billing_period = BillingPeriod.new
  end

  def create
    @billing_period = current_user.billing_periods.build(params[:billing_period])

    if @billing_period.save
      redirect_to billing_periods_path
    else
      flash[:error] = @billing_period.errors.map(&:message).join(', ')
      render :index
    end
  end

  def destroy
  end


private
  def fetch_billing_periods
    @billing_periods = current_user.billing_periods
  end

end
