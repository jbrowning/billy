class RenameBillingScheduleToRecurringBill < ActiveRecord::Migration
  def up
    rename_table :billing_schedules, :recurring_bills
  end

  def down
    rename_table :recurring_bills, :billing_schedules
  end
end
