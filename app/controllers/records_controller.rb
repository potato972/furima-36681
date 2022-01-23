class RecordsController < ApplicationController
  before_action :authenticate_user!

  def index
    @record_destination = RecordDestination.new
  end

  def create
    @record_destination = RecordDestination.new(record_params)
    if @record_destination.valid?
      @record_destination.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def record_params
    params.require(:record_destination).permit(:post_code, :area_id, :municipalities, :address, :building, :tel).merge(item_id: current_item.id, user_id: current_user.id)
  end
end
