class UserMailer < ApplicationMailer
  def welcome(user)
    @user = user
    mail( :to => @user.email , :subject=> "Welcome #{ @user.first_name}", :cc => "tripti.895@gmail.com" )
  end

  def order_status(order)
    @order = order
    mail( :to => @order.user.email , :subject=> "Status Change for #{ @order.id}", :cc => "tripti.895@gmail.com" )
  end

end
