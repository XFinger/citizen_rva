class Address < ActiveRecord::Base
   acts_as_gmappable :process_geocoding => :geocode?, :lat => 'lat', :lng => 'lng'

def gmaps4rails_address
  "#{self.street}, #{self.city}, #{self.state}" 
end
  
  
  belongs_to :addressable, :polymorphic => true
  def styled_address
    "#{self.street} #{self.city}, #{self.state.upcase}"
  end 
  
  
end
