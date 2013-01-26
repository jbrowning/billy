class CreateBillingPeriods < ActiveRecord::Migration
  def change
    create_table :billing_periods do |t|
      t.integer :user_id
      t.integer :begin_date
      t.integer :end_date

      t.timestamps
    end
  end
end
