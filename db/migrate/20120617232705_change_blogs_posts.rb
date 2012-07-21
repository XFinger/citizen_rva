class ChangeBlogsPosts < ActiveRecord::Migration
  def up
    change_column :blogs, :post, :text
  end

  def down
  end
end
