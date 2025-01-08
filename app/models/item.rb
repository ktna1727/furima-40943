class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  validates :item_name, :description, :price, :area_id, :category_id, :condition_id, :estimated_shipping_date_id,
            :shipping_cost_responsibility_id, :image, presence: true
  has_one_attached :image
  validates :price, numericality: { only_integer: true, greater_than: 300, less_than_or_equal_to: 9_999_999 },
                    format: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください' }
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :category
  belongs_to :condition
  belongs_to :estimated_shipping_date
  belongs_to :shipping_cost_responsibility
  validates :area_id, :category_id, :condition_id, :estimated_shipping_date_id, :shipping_cost_responsibility_id,
            numericality: { other_than: 1, message: 'を選択してください' }
end
