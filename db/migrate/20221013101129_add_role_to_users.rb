class AddRoleToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :role, :boolean, default: true
  end
end
