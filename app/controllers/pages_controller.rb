class PagesController < ApplicationController
  before_filter :redirect_user
  
  def home
  end


  private

  def redirect_user
    if current_user
      redirect_to billing_periods_path
    end
  end
end
