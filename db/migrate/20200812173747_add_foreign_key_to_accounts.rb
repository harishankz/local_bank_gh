class AddForeignKeyToAccounts < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :accounts, :users, column: :customer_id, primary_key: :user_id
  end
end
