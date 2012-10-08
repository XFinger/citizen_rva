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


end
