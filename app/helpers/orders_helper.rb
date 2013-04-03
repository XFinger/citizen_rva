module OrdersHelper
  def order_receipt(count, name, desc, price)       
      content_tag :div do
        concat(content_tag(:p,
          (content_tag(:span, count) + " " + name + " " + desc), :class => 'receipt_desc') +
            (content_tag(:span, (deci_plain count * price), :class => "pull-right_r")))
      end      
   end
   
  def order_list(count, name)          
      content_tag :div do
       concat(content_tag(:span, count, :class => "spacer")) 
         concat(content_tag(:span, name))
          
         
      end      
  end   
     def oooorder_receipt(count, name, desc, price)       
      content_tag :div do
       concat(content_tag(:span, count, :class => "spacer"))
        concat(content_tag(:span, name, :class => "spacer")) 
         concat(content_tag(:p, desc, :class => 'receipt_desc') +
         (content_tag( :span, (deci_plain count * price), :class => "pull-right_r")))
         
      end      
   end

end
