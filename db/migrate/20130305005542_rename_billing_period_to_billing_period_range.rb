class RenameBillingPeriodToBillingPeriodRange < ActiveRecord::Migration
  def up
    rename_table :billing_periods, :billing_period_ranges
  end

  def down
    rename_table :billing_period_ranges, :billing_periods
  end
end
