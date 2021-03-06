class Order < ActiveRecord::Base
 acts_as_gmappable :lat => 'lat', :lng => 'lng', :process_geocoding => false,
                  :address => "address", :normalized_address => "address",
                  :msg => "Sorry, not even Google could figure out where that is"


  belongs_to :user
  
  attr_accessible :delivery_time, :confirmed, :delivery, :delivery_instruct, :dishes_attributes, :user_id,
                  :salads_attributes, :sides_attributes, :drinks_attributes, :address_attributes
                   
  validates :delivery_time, :presence => true
 
   
  has_many :dishes, :as => :useable, :dependent => :destroy
  has_many :salads, :as => :useable, :dependent => :destroy
  has_many :sides, :as => :useable, :dependent => :destroy
  has_many :drinks, :as => :useable, :dependent => :destroy
  has_one :address, :as => :addressable, :dependent => :destroy
  accepts_nested_attributes_for :dishes, :allow_destroy => true #, :reject_if => lambda { |a| a[:count].blank? }
  accepts_nested_attributes_for :sides, :allow_destroy => true #, :reject_if => lambda { |b| b[:s_count].blank? }
  accepts_nested_attributes_for :drinks, :allow_destroy => true #, :reject_if => lambda { |c| c[:d_count].blank? }
  accepts_nested_attributes_for :address, :allow_destroy => true
  

 


end
