class BillingPeriod < ActiveRecord::Base
  attr_accessible

  belongs_to :user
  has_many   :bills

  validates :user, :begin_date, :end_date, presence: true
  validates :begin_date, :end_date, uniqueness: { scope: :user_id }
end
