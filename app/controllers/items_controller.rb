class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: '商品を登録しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def item_params
    params.require(:item).permit(:item_name, :description, :price, :area_id, :category_id, :condition_id,
                                 :estimated_shipping_date_id, :shipping_cost_responsibility_id, :image).merge(user_id: current_user.id)
  end
end
