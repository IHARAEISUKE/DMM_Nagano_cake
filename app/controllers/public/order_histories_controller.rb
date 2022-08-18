class Public::OrderHistoriesController < ApplicationController

  def new
    @order = OrderHistory.new
  end

  def check
     @order = OrderHistory.new(orderhistory_params)
     @cartitems= current_customer.cart_items
     @postage = '800'

     # 自身の住所を選んだ場合
      if params[:order_history][:address_number] == "1"
        @order.shipping_address = current_customer.address
        @order.shipping_postal_code = current_customer.postal_code
        @order.shipping_name = current_customer.full_name

     # 既存の住所を選んだ場合
      elsif params[:order_history][:address_number] == "2"
        @order.shipping_address = Address.find(params[:order_history][:registered]).address
        @order.shipping_postal_code = Address.find(params[:order_history][:registered]).postal_code
        @order.shipping_name = Address.find(params[:order_history][:registered]).name

      end
  end

  def complete
  end

  def create
    @order_history = OrderHistory.new(orderhistory_params)
    @order_history.save
    @cartitem = current_customer.cart_items
    @cartitem.each do |cartitem|
    @order_detail = OrderDetail.new
    @order_detail.order_history_id = @order_history.id
    @order_detail.item_id = cartitem.item.id
    @order_detail.price = cartitem.item.add_tax_price
    @order_detail.amount = cartitem.amount
    @order_detail.save
    end

    @cartitem.destroy_all
    redirect_to complete_order_histories_path
  end

  def index
    @orders= current_customer.order_histories
  end

  def show
    @order = OrderHistory.find(params[:id])
    @orders = @order.order_details

  end

private
def orderhistory_params
  params.require(:order_history).permit(:shipping_address,:shipping_name,:customer_id,:shipping_postal_code,:postage,:payment,:payment_method,:status)
end

def order_detail_params
  params.require(:order_detail).present(:order_id,:items_id,:price,:amount,:making_status)
end

end
