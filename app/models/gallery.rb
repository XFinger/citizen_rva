class Gallery < ActiveRecord::Base
  has_many :photos
  accepts_nested_attributes_for :photos, :allow_destroy => true
  mount_uploader :image, ImageUploader  
  def image_changed?
    @image_changed
  end
  
  
end
