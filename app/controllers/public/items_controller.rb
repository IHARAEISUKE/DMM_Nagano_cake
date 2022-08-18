class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

def show
  @item = Item.find(params[:id])
  @cartitem = CartItem.new
  
end


private
    def item_params
      params.require(:item).permit(:name, :introduction, :price, :image, :genre_id, :is_active)
    end

end
