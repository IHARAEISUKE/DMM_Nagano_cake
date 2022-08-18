class Admin::OrderHistoriesController < ApplicationController

  def show
    @order = OrderHistory.find(params[:id])
    @orders = @order.order_details
  end

  def update
    @order = OrderHistory.find(params[:id])
    if @order.update(orderhistory_params)
       @order.order_details.update_all(making_status: 1) if @order.status == "入金確認"
       redirect_back(fallback_location: root_path)
    end
  end
   # @order.update(orderhistory_params)
    #redirect_to admin_order_history_path(@order.id)
  #end

private
def orderhistory_params
  params.require(:order_history).permit(:shipping_address,:shipping_name,:customer_id,:shipping_postal_code,:postage,:payment,:payment_method,:status)
end

def order_detail_params
  params.require(:order_detail).present(:order_id,:items_id,:price,:amount,:making_status)
end


end
