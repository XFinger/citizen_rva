class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :gallery_id
      t.string :caption
      t.integer :position
      t.string :image
      t.string :name
      t.string :remote_image_url

      t.timestamps
    end
  end
end
