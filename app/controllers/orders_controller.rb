class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  def index
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      @order_form.save
      redirect_to root_path, notice: '購入が完了しました'
    else
      render :index, status: :unprocessable_entity
    end

    redirect_to root_path
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
    redirect_to root_path if current_user.id == @item.user_id
  end
end
