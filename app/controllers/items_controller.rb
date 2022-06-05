class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
  end
  
  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
    redirect_to root_path
    else
    render :new
    end
  end

private
  def item_params
    params.require(:item).permit(:name, :explain, :category_id, :status_id, :shippingfee_payer_id, :prefecture_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
