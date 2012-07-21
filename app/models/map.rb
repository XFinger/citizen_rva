class Map < ActiveRecord::Base
  
  acts_as_gmappable :process_geocoding => :geocode?
end
