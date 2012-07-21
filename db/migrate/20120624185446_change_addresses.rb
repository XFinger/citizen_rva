class ChangeAddresses < ActiveRecord::Migration
  def up
    rename_column :addresses, :telephone, :phone
  end

  def down
  end
end
