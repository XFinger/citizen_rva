class FixTheUsersState < ActiveRecord::Migration
  def up
    change_column :users, :aasm_state, :string, :default => 'out'
  end

  def down
  end
end
