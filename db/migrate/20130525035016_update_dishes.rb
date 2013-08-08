class UpdateDishes < ActiveRecord::Migration
  def up
 
    add_column :dishes, :alt_desc, :string
    
  end

  def down
  end
end
