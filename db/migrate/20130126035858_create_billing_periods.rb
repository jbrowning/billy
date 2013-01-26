class CreateBillingPeriods < ActiveRecord::Migration
  def change
    create_table :billing_periods do |t|
      t.integer :user_id, null: false
      t.integer :begin_date, null: false
      t.integer :end_date, null:false

      t.timestamps
    end
  end
end
