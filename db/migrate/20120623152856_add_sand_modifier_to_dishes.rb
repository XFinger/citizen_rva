class AddSandModifierToDishes < ActiveRecord::Migration
  def change
    add_column :dishes, :is_sand, :boolean
  end
end
