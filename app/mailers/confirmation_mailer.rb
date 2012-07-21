class ConfirmationMailer < ActionMailer::Base
  helper [:orders, :application]
  default :css => :email
  default :from => 'xfinger@gmail.com'
  
  def order_confirmation(user, address, order)
    @address=address
    @order=order
    @user=user
  

    mail(:to => user.email, :subject => "Your citizen order has been confirmed" )
  end
  
end
