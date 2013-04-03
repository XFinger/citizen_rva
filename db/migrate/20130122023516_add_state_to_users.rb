class AddStateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :aasm_state, :string, :default => 'out'
  end
end
