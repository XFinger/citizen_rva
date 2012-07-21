class Menu < ActiveRecord::Base
  
  has_many :dishes, :as => :useable
  has_many :salads, :as => :useable
  has_many :sides, :as => :useable
  accepts_nested_attributes_for :dishes, :allow_destroy => true
  accepts_nested_attributes_for :salads, :allow_destroy => true
  accepts_nested_attributes_for :sides, :allow_destroy => true  

end

