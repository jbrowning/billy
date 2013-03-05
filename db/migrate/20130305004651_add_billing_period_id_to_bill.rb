class AddBillingPeriodIdToBill < ActiveRecord::Migration
  def change
    add_column :bills, :billing_period_id, :integer
  end
end
