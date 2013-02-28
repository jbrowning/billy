class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.integer :user_id, null: false
      t.string :name, null: false
      t.integer :amount_cents, null: false, default: 0
      t.date :date_due
      t.date :date_paid
      t.boolean :settled, null:false, default: false

      t.timestamps
    end
  end
end
