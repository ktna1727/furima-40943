class OrderForm
  include ActiveModel::Model
  attr_accessor :post_number, :area_id, :municipalities, :street_address, :building_name, :phone_number, :user_id, :item_id,
                :token

  with_options presence: true do
    validates :municipalities
    validates :street_address
    validates :area_id, numericality: { other_than: 0, message: 'を選択してください' }
    validates :post_number, format: { with: /\A\d{3}-\d{4}\z/, message: 'は3桁-4桁の半角数字で入力してください' }
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: 'は10から11桁の半角数字で入力してください' }
    validates :user_id
    validates :item_id
    validates :token
  end
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
