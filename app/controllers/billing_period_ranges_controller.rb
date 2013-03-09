class BillingPeriodRangesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :fetch_billing_periods

  def index
    @billing_period_range = BillingPeriodRange.new
  end

  def create
    @billing_period_range = current_user.billing_period_ranges.build(params[:billing_period_range])

    if @billing_period_range.save
      redirect_to billing_period_ranges_path
    else
      flash[:error] = @billing_period_range.errors.map(&:message).join(', ')
      render :index
    end
  end

  def destroy
    billing_period_range = BillingPeriodRange.find(params[:id])
    if billing_period_range.destroy
      flash[:notice] = "billing period deleted"
    else
      flash[:error] = "there was a problem deleting the billing period"
    end

    redirect_to index
  end


private
  def fetch_billing_periods
    @billing_period_ranges = current_user.billing_period_ranges
  end

end
