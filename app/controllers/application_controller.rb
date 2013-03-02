class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :get_balance

  def after_sign_in_path_for(resource)
    billing_periods_path
  end

  def get_balance
    if current_user
      @balance = BalanceCalculator.new current_user
    end
  end
end
