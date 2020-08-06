class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts, id: false do |t|
      t.string :account_id, primary_key: true, null: false
      t.string :account_type
      t.date :open_date
      t.string :customer_id, foreign_key: true
      t.string :customer_name
      t.string :branch
      t.boolean :minor_indicator

      t.timestamps
    end


    add_index :accounts, :account_id
    add_index :accounts, [:account_id, :customer_id]
    add_index :accounts, [:account_id, :account_type]
    add_index :accounts, [:account_id, :customer_name]
    add_index :accounts, [:account_id, :branch]
  end
end
