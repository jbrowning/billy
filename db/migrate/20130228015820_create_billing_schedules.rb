class CreateBillingSchedules < ActiveRecord::Migration
  def change
    create_table :billing_schedules do |t|
      t.integer :user_id, null: false
      t.string :name, null: false
      t.integer :billing_period_id, null: false
      t.integer :amount_cents
      t.integer :due_day

      t.timestamps
    end
  end
end
