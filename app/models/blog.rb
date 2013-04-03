class Blog < ActiveRecord::Base
   mount_uploader :pic, PicUploader
   
   attr_accessible :pic, :title, :published_on, :post, :published
end
