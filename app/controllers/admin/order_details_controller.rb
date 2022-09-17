class Admin::OrderDetailsController < ApplicationController
    def update
        @order_details = OrderDetail.find(params[:id])
        @order_details.update
        redirect_to admin_orders_path
    end
    
    private
    
    def order_details_params
        params.require(:order_details).permit(:maiking_status)
    end
end
