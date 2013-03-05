class RenameBillingPeriodReferences < ActiveRecord::Migration
  def up
    rename_column :billing_schedules, :billing_period_id, :billing_period_range_id
    rename_column :bills, :billing_period_id, :billing_period_range_id
  end

  def down
    rename_column :billing_schedules, :billing_period_range_id, :billing_period_id
    rename_column :bills, :billing_period_range_id, :billing_period_id
  end
end
