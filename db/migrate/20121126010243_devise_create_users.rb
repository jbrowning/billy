class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      ## Database authenticatable
      t.string  :email,              :null => false, :default => ""
      t.string  :encrypted_password, :null => false, :default => ""
      t.string  :name,               :null => false
      t.integer :balance,            :null => false, :default => 0

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      t.timestamps
    end

    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true
  end
end
