class AddToAddress < ActiveRecord::Migration
  def up
    add_column :addresses, :gmaps, :boolean
  end
  

  def down
  end
end
