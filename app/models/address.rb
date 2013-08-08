class Address < ActiveRecord::Base
   acts_as_gmappable :lat => 'lat', :lng => 'lng', :process_geocoding => false,
                  :address => "address", :normalized_address => "address",
                  :msg => "Sorry, not even Google could figure out where that is"

belongs_to :addressable, :polymorphic => true

validates_length_of :phone, :is => 10, :message => 'must be 10 digits, excluding special characters such as spaces and dashes. No extension or country code allowed.', :if => Proc.new{|o| !o.phone.blank?}



def gmaps4rails_address
  "#{self.street}, #{self.city}, #{self.state}" 
end
  


  def styled_address
    "#{self.street} #{self.city}, #{self.state.upcase}"
  end 
  
  
end
