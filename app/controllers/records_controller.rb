class RecordsController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @record_destination = RecordDestination.new
  end

  def create
    @item = Item.find(params[:item_id])
    @record_destination = RecordDestination.new(record_params)
    if @record_destination.valid?
      @record_destination.save
      redirect_to root_path
    else
      render :index
    end


  end

  private

  def record_params
    params.require(:record_destination).permit(:post_code, :area_id, :municipalities, :address, :building, :tel).merge(user_id: current_user.id, item_id: @item.id)
  end
end
