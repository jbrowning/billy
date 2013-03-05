class BillingPeriodRange < ActiveRecord::Base
  attr_accessible :begin_date, :end_date

  belongs_to :user
  has_many :bills

  validates :user, :begin_date, :end_date, presence: true
  validate :sane_date_range

  class GapInCoverageError < StandardError;end
  class OverlappingCoverageError < StandardError;end
  def self.check_coverage(user)
    possible_dates = (1..31).to_a

    # check for overlapping coverage
    user.billing_period_ranges.each do |period|
      end_date = period.end_date == -1 ? 31 : period.end_date
      billing_range = Range.new(period.begin_date, end_date)

      billing_range.each do |date| 
        raise OverlappingCoverageError if possible_dates.delete(date).nil?
      end
    end

    # check for gaps in coverage
    raise GapInCoverageError unless possible_dates.empty?

    # If we've made it this far, we're good
    true
  end

  def sane_date_range
    if begin_date > end_date && end_date != -1
      errors.add :begin_date, "can't be less than the end date"
    end
  end
end
