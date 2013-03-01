class Bill < ActiveRecord::Base
  belongs_to :user

  validates :name, :amount_cents, presence: true
  
  attr_accessible :amount_cents, :date_due, :date_paid, :name, :settled

  def self.settled
    where(settled: true)
  end

  def self.unsettled
    where(settled: false)
  end
end
