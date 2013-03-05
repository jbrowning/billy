class Bill < ActiveRecord::Base
  belongs_to :user
  belongs_to :billing_period_range

  validates :name, :amount_cents, presence: true
  
  attr_accessible :amount, :date_due, :date_paid, :name, :settled
  monetize :amount_cents

  def self.settled
    where(settled: true)
  end

  def self.unsettled
    where(settled: false)
  end

  def paid?
    date_paid.present?
  end
end
