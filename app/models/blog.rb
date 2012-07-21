class Blog < ActiveRecord::Base
   mount_uploader :pic, PicUploader
end
