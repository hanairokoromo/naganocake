class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end
  
  def update
    @order = Order.find(params[:id])
    @order.update
    redirect_to admin_orders_path
  end
  
  private
  
  def order_params
    params.require(:order).permit(:status, :maiking_status)
  end
end
