class EditPhotos < ActiveRecord::Migration
  def up
    change_column :photos, :remote_image_url, :text
  end

  def down
  end
end
