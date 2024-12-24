class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  def index
    @order = Order.new
  end

  def create
    Order.create(order_params)
  end

  private

  def order_params
    params.require(:order_form).permit(:post_number, :area_id, :municipalities, :street_address, :building_name, :phone_number)
          .merge(user_id: current_user.id, item_id: @item.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def correct_user
    redirect_to root_path unless current_user.id == @item.user_id
  end
end
