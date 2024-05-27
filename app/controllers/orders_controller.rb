class OrdersController < ApplicationController
  def index
    @orders = current_user.orders 
  end
  def show
    @order = Order.find(params[:id])
  end
  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_url, notice: 'Order was successfully destroyed.'
  end
    

  def add_to_orders
    product = Product.find(params[:product_id])
    product_quantity = params[:dropdown].to_i
    user = current_user
    total = product.price* product_quantity 
    

    @order = Order.new(
      product_id: product.id,
      product_quantity: product_quantity,
      user_id: user.id,
      total: total
      
    )

    if @order.save
      redirect_to orders_path, notice: 'Product added to cart successfully.'
    else
      flash.now[:alert] = 'Failed to add product to cart.'
      render :new
    end
  end
  def buy
    order = Order.find(params[:id])
    total = params[:query].to_f
    # Place your logic here to process the purchase, such as sending an email, updating the order status, etc.
    flash[:notice] = "Your order has been placed. Total amount: #{total}"
    redirect_to orders_path
  end
  
end
