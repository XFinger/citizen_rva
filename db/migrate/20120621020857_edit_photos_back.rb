class EditPhotosBack < ActiveRecord::Migration
  def up
    change_column :photos, :remote_image_url, :string
    
  end

  def down
  end
end
