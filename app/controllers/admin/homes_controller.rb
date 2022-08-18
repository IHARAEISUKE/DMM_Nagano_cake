class Admin::HomesController < ApplicationController

  def top
    @orders = OrderHistory.all
  end

private
def orderhistory_params
  params.require(:order_history).permit(:shipping_address,:shipping_name,:customer_id,:shipping_postal_code,:postage,:payment,:payment_method,:status)
end

def order_detail_params
  params.require(:order_detail).present(:order_id,:items_id,:price,:amount,:making_status)
end

end
