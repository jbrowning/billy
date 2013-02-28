class Bill < ActiveRecord::Base
  belongs_to :user

  validates :name, :amount_cents, presence: true
  
  attr_accessible :amount_cents, :date_due, :date_paid, :name, :settled

end
