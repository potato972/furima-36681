class ItemsController < ApplicationController

  def index
   # @category = Item.order("created_at DESC")
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :content, :category_id, :status_id, :postage_id, :area_id, :day_id, :price).merge(user_id: current_user.id)
  end
end
