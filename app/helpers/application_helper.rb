module ApplicationHelper
  
     def deci(value) 
      unless value.blank?
        ' ...$' + (sprintf "%.2f", value)  
      end
   end
   
   def deci_plain(value) 
      unless value.blank?
        '$' + (sprintf "%.2f", value)  
      end
   end

end
