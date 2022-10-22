class Public::OrdersController < ApplicationController
  
  def new
    @addresses = Address.all
    @order = Order.new
  end

  def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if params[:order][:address_id] == "1"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_id] == "2"
      @order.postal_code = Address.find(params[:order][:address_id]).postal_code
      @order.address = Address.find(params[:order][:address_id]).address
      @order.name = Address.find(params[:order][:address_id]).name
    end
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end
  
  def create
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    @order.status = 0
    @order.save
    @order_detail = OrderDetail.new
    @cart_items.each do |cart_item|
      OrderDetail.create(
       item: cart_item.item,
       price: cart_item.item.price,
       amount: cart_item.amount,
       order: @order
      )
      @order_detail.save
    end
    @cart_items.destroy_all
    redirect_to complete_orders_path
  end

  def complete
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
     @total = @order.total_payment - 800
  end
  
  private
  
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :customer_id, :shipping_cost, :total_payment, :customer_id)
  end
end
