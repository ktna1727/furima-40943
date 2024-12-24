class OrderForm
  include ActiveModel::Model
  def save
    # 購入履歴を保存
    order = Order.create(user_id:, item_id:)
    # 住所情報を保存
    Address.create(
      post_number:,
      area_id:,
      municipalities:,
      street_address:,
      building_name:,
      phone_number:,
      order_id: order.id
    )
  end
end
