class BuyerController < ApplicationController
  #layout "my_page" 
  
  def catalog
    @product=Product.find(:all)
    @buyer=session[:user_id]
  end

  def show
    @product=Product.find(:all)
    if request.post?
      @cart=Cart.find_all_by_buyer_id(session[:user_id])
      if !@cart.empty?
        @cart.each do |c|
          c.destroy
        end
      end
      @product = []
      products=params[:catalog][:product_ids]
      unless products.empty?
        products.each do |product|
          p=Product.find(product)
           Cart.create(:product_id=>p.id,:buyer_id=>session[:user_id],:seller_id=>p.admin_id)
           @product << p
        end
      end
      respond_to do |format|
        format.js #{render :js => "show"}
      end
    end
    
  end
  
  def cart_catalog
    @cart=Cart.find_all_by_buyer_id(session[:user_id])
    #@quan=Hash.new[1..20]
  end
  
  def display_total
    @price=params[:price].to_i
    @value=params[:count].to_i
    @cart=params[:cart].to_i
    logger.info "========= #{@price.inspect}=== #{@value.inspect}==== #{@cart.inspect}"
      cart=Cart.find(@cart)
      cart.update_attributes(:quantity=>@value,:total=>"#{@price*@value}")
      cart.save
      render :js => "$('#total#{@cart}').html(#{@price*@value});"
    # respond_to do |format|
      # format.js
    # end
  end
  
  def pay
    @cart=Cart.find(:all)
    @order=Order.find(:all)
    @order.each do |o|
      o.destroy
    end
    if !@cart.empty?
      @cart.each do |cart|
        order=Order.create(:product_id=>cart.product_id,:buyer_id=>cart.buyer_id,:seller_id=>cart.seller_id,
        :total_price=>cart.total,:quantity => cart.quantity)
      end
    end
  end
  
  def print_receipt
    @order=Order.find(:all)
    if !@order.empty?
      @order.each do |order|
        flash[:notice]= "Successfully sent"
        UserMailer.welcome_email(order).deliver
      end
    else
         flash[:notice]="Error in sending mail"
    end
  end
  
end
