class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      pay_item
      @order_form.save
      redirect_to root_path, notice: '購入が完了しました'
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :new, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_form).permit(:post_number, :area_id, :municipalities, :street_address, :building_name, :phone_number)
          .merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_kye = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def correct_user
    redirect_to root_path if current_user.id == @item.user_id
  end
end
