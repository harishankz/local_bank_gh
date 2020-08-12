class AddColumnTokenToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :token,  :text
  end
end
