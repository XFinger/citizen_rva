class RenameOne < ActiveRecord::Migration
  def up
  rename_column :boxmenus, :pdf, :box_pdf
  
  end

  def down
  end
end
