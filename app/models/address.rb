class Address < ActiveRecord::Base
   acts_as_gmappable :lat => 'lat', :lng => 'lng', :process_geocoding => false,
                  :address => "address", :normalized_address => "address",
                  :msg => "Sorry, not even Google could figure out where that is"

belongs_to :addressable, :polymorphic => true

def gmaps4rails_address
  "#{self.street}, #{self.city}, #{self.state}" 
end
  
  

  #belongs_to :user
  def styled_address
    "#{self.street} #{self.city}, #{self.state.upcase}"
  end 
  
  
end
