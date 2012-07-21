class MapsController < ApplicationController
 
  def show
    @citizen_address='909 E. Main St Richmond VA, 23219'
    @citizen = GeoKit::Geocoders::MultiGeocoder.geocode(@citizen_address)
    @lat = "37.5378169"
    @lng = "-77.436316"
    @markers = '[
             {"description": "909 E. Main St Richmond VA, 23219", "title": "Citizen", "sidebar": "", "lng": "-77.436316", "lat": "37.5378169"} 
            ]'

 
  end
 def directions 
   @address=params[:dest]
    @lat = "37.5378169"
    @lng = "-77.436316"
 end
 
end
