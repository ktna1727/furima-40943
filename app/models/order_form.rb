class OrderForm
  include ActiveModel::Model
  attr_accessor :post_number, :area_id, :municipalities, :street_address, :building_name, :phone_number, :user_id, :item_id,
                :token, :existing_image

  with_options presence: true do
    validates :municipalities
    validates :street_address
    validates :post_number, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/ }
    validates :user_id
    validates :item_id
    validates :token
  end
  def self.model_name
    ActiveModel::Name.new(self, nil, 'OrderForm')
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
