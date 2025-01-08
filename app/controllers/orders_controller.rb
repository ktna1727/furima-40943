class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :correct_user, only: [:index, :create]
  before_action :redirect_if_sold, only: [:index, :create]
  def index
    @item = Item.find(params[:item_id])
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

      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_form).permit(:post_number, :area_id, :municipalities, :street_address, :building_name, :phone_number)
          .merge(user_id: current_user.id, item_id: @item.id, token: params[:token], existing_image: params[:existing_image])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def redirect_if_sold
    redirect_to root_path if @item.order.present?
  end

  def correct_user
    redirect_to root_path if current_user.id == @item.user_id
  end
end
