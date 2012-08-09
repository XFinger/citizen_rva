module OrdersHelper
  def order_receipt(count, desc, price)       
      content_tag :div do
       concat(content_tag(:span, count, :class => "spacer")) 
         concat(content_tag(:span, desc))
          concat(content_tag( :span, (deci_plain count * price), :class => "pull-right_r"))
         
      end      
   end
   
  def order_list(count, name)          
      content_tag :div do
       concat(content_tag(:span, count, :class => "spacer")) 
         concat(content_tag(:span, name))
          
         
      end      
  end   
   
end
