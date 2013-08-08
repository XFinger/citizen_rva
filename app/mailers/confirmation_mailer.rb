class ConfirmationMailer < ActionMailer::Base
  helper [:orders, :application]
  default :css => :email
  default :from => 'citizenrva@verizon.net'
  
  def order_confirmation(user, address, order)
    @address=address
    @order=order
    @user=user
  

    mail(:to => 'citizenrva@verizon.net', :subject => "New Citizen Order" )
  end
  
end
