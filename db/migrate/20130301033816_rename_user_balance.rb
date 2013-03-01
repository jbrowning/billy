class RenameUserBalance < ActiveRecord::Migration
  def up
    rename_column :users, :balance, :balance_cents
  end

  def down
    rename_column :users, :balance_cents, :balance
  end
end
