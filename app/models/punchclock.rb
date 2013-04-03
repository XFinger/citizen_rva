class Punchclock < ActiveRecord::Base
  belongs_to :user
  ##########################attr_accessible :user_name, :in, :out, :paydate, :payperiod
 
 
  

  #scope period
  #scope in or out
  #scope by user
  #scope next and last
end
