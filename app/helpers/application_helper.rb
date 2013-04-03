module ApplicationHelper
  
   def deci(value) 
      unless value.blank?
        ' ... $' + (sprintf "%.2f", value)  
      end
   end
   
   def deci_plain(value) 
      unless value.blank?
        '$' + (sprintf "%.2f", value)  
      end
   end
   
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  
  def humanize secs
    [[60, :seconds], [60, :minutes], [24, :hours], [1000, :days]].inject([]){ |s, (count, name)|
      if secs > 0
        secs, n = secs.divmod(count)
        s.unshift "#{n.to_i} #{name}"
      end
      s
    }.join(' ')
  end
def format_time (timeElapsed)
 
    @timeElapsed = timeElapsed
 
    #find the seconds
    seconds = @timeElapsed % 60
 
    #find the minutes
    minutes = (@timeElapsed / 60) % 60
 
    #find the hours
    hours = (@timeElapsed/3600)
 
    #format the time
 
    return hours.to_s + " Hours " + format("%02d",minutes.to_s) + " Minutes"
  end
  def just_date(d)
    d.strftime('%a %b %d')
  end
  def just_time(t)
    t.strftime('%I:%M, %p')
  end

end
