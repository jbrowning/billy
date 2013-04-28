class CreateNewBillingPeriods < ActiveRecord::Migration
  def change
    create_table :billing_periods do |t|
      t.integer :user_id, null: false
      t.date :begin_date, null: false
      t.date :end_date,   null: false

      t.timestamps
    end
  end
end
