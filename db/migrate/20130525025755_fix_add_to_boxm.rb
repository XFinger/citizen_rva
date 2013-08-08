class FixAddToBoxm < ActiveRecord::Migration
  def up
    remove_column :boxmenus, :receipt_name
    add_column :dishes, :alias, :string
  end

  def down
  end
end
