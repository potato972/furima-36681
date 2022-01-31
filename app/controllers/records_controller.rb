class RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :contributor_confirmation, only: [:index]


  def index
    @item = Item.find(params[:item_id])
    @record_destination = RecordDestination.new
    if @item.record
      redirect_to root_path
    end

  end

  def create
    @item = Item.find(params[:item_id])
    @record_destination = RecordDestination.new(record_params)
    if @record_destination.valid?
      pay_item
      @record_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def record_params
    params.require(:record_destination).permit(:post_code, :area_id, :municipalities, :address, :building, :tel).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: record_params[:token],
      currency: 'jpy'
    )
  end

  def contributor_confirmation
    @item = Item.find(params[:item_id])
    redirect_to root_path unless current_user.id == @item.user_id
  end

end
