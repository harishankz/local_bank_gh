class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, id: false do |t|
      t.string :user_id, primary_key: true, null: false
      t.string :user_name
      t.date :date_of_birth
      t.string :gender
      t.string :phone_number
      t.string :role_id, foreign_key: true

      t.timestamps
    end

    add_index :users, :user_id
    add_index :users, [:user_id, :user_name]
    add_index :users, [:user_id, :phone_number]
  end
end
