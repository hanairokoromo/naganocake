class Admin::OrderDetailsController < ApplicationController
    def update
        @order_detail = OrderDetail.find(params[:id])
        @order_detail.update(order_detail_params)
        redirect_to admin_orders_path
    end
    
    private
    
    def order_detail_params
        params.require(:order_detail).permit(:maiking_status)
    end
end
