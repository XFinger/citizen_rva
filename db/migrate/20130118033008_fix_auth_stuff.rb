class FixAuthStuff < ActiveRecord::Migration
  def up
    drop_table :roles
    drop_table :roles_users
    drop_table :schedules
    remove_column :users, :admin
    add_column :users, :role, :string
    add_column :users, :roles_mask , :integer
  end

  def down
  end
end
