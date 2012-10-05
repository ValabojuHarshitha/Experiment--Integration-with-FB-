class UserMailer < ActionMailer::Base
  default :from => "notifications@example.com"
 
  def welcome_email(order)
    #logger.info "=========== userrrrrr #{user.inspect}"
    @user = Admin.find(order.seller_id)
    logger.info "--------- user--- #{@user.inspect}"
    @order=order
    #@url  = "http://example.com/login"
   mail(:to => @user.email, :subject => "Welcome to My Awesome Site")
  end
  
end
