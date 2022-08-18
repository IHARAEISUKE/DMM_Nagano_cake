class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    count = 0
    @order_detail.order_history.order_details.each do |order_detail|
      if order_detail.making_status == "製作中"
    @order_detail.order_history.update(status: "製作中")

      elsif order_detail.making_status == "製作完了"
        count += 1
        puts "----"
      end
    end
     @order_detail.order_history.update(status: "発送準備中") if count == @order_detail.order_history.order_details.size
    redirect_to admin_order_history_path(@order_detail.order_history.id)
  end

  private
def order_detail_params
  params.require(:order_detail).permit(:order_id,:items_id,:price,:amount,:making_status)
end

end
