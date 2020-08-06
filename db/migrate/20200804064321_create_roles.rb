class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles, id: false do |t|
      t.string :role_id, primary_key: true, null: false
      t.string :role_name, unique: true
      t.string :role_code, unique: true

      t.timestamps
    end

    add_index :roles, :role_name
    add_index :roles, [:role_name, :role_id]
    add_index :roles, [:role_id, :role_code]
  end
end
