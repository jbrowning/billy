class BillingSchedule < ActiveRecord::Base
  belongs_to :user
  belongs_to :billing_period

  validates :name, :billing_period, presence: true
  
  attr_accessible :amount_cents, :billing_period_id, :due_day, :name

end
