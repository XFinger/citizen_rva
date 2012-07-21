class Order < ActiveRecord::Base
      acts_as_gmappable :process_geocoding => true 
  
  belongs_to :user

  has_many :dishes, :as => :useable
  has_many :salads, :as => :useable
  has_many :sides, :as => :useable
  has_many :drinks, :as => :useable
  has_one :address, :as => :addressable
  accepts_nested_attributes_for :dishes, :allow_destroy => true #, :reject_if => lambda { |a| a[:count].blank? }
  accepts_nested_attributes_for :sides, :allow_destroy => true #, :reject_if => lambda { |b| b[:s_count].blank? }
  accepts_nested_attributes_for :drinks, :allow_destroy => true #, :reject_if => lambda { |c| c[:d_count].blank? }
  accepts_nested_attributes_for :address, :allow_destroy => true
  accepts_nested_attributes_for :salads, :allow_destroy => true #, :reject_if => lambda { |e| e[:sal_count].blank? }

end
