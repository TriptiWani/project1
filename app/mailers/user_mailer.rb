class UserMailer < ApplicationMailer
  def welcome(user,admin)
    @user = user
    @admin = admin
    mail( :to => @user.email , :subject=> "Welcome #{ @user.first_name}", :cc => @admin.email )
  end

  def order_status(order,admin)
    @order = order
    @admin = admin
    mail( :to => @order.user.email , :subject=> "Status Change for #{ @order.id}", :cc => @admin.email  )
  end

end
