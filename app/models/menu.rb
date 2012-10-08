class Menu < ActiveRecord::Base
  mount_uploader :pdf, PdfUploader
  has_many :dishes, :as => :useable
  has_many :salads, :as => :useable
  has_many :sides, :as => :useable
  has_many :breakfasts, :as => :useable
  accepts_nested_attributes_for :dishes, :allow_destroy => true
  accepts_nested_attributes_for :salads, :allow_destroy => true
  accepts_nested_attributes_for :sides, :allow_destroy => true  
  accepts_nested_attributes_for :breakfasts, :allow_destroy => true  
end

