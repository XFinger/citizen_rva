class AddPdfToMenus < ActiveRecord::Migration
  def change
    add_column :menus, :pdf, :string

  end
end
