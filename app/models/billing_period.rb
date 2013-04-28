class BillingPeriod < ActiveRecord::Base
  attr_accessible :end_date, :start_date, :user_id
end
