class OrderForm
  include ActiveModel::Model
  def save
    order = Order.create(user_id:, item_id:)
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
