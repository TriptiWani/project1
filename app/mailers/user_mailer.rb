class UserMailer < ApplicationMailer
  def welcome(user,admin)
    @user = user
    @admin = admin
    mail( :to => @user.email , :subject=> "Welcome #{ @user.first_name}", :cc => @admin.email )
  end

  def order_status(order,admin)
    @order = order
    @admin = admin
    mail( :to => @order.user.email , :subject=> "Status Change for Order#{ @order.id}", :cc => @admin.email  )
  end

  def product_added(product,admin)
    @product = product
    @admin = admin
    mail( :to => @admin.email , :subject=> "Addition of product #{ @product.model_num}" )
  end

  def report(orders,admin,from,to)
    @order_items = orders
    @admin = admin
    @from_date = from
    @to_date = to
    mail( :to => @admin.email , :subject=> "Report for #{ @from_date} - #{ @to_date} generated on #{ Time.now.strftime("%Y-%d-%m")}"  )
  end
end
