class ItemsController < ApplicationController

  def index
   # @category = Item.order("created_at DESC")
  end

  private

  def item_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user)
  end
end
