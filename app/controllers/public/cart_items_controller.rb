class Public::CartItemsController < ApplicationController
def index
  @cartitems= current_customer.cart_items
  @total = @cartitems.inject(0) { |sum, item| sum + item.sum_of_price }

end


def create
  @cartitems = CartItem.all
  @cartitem = CartItem.new(cart_item_params)
  @cartitem.customer_id = current_customer.id
  @cartitem.save
  redirect_to cart_items_path
end

def update
  @cartitem = CartItem.find(params[:id])
  @cartitem.update(cart_item_params)
  redirect_to cart_items_path
end

def destroy
  @cartitem = CartItem.find(params[:id])
  @cartitem.destroy
  redirect_to cart_items_path
end

def destroy_all
   @cartitems = current_customer.cart_items
   @cartitems.destroy_all
   redirect_to cart_items_path
end

private
def cart_item_params
  params.require(:cart_item).permit(:amount,:item_id)
end

end
