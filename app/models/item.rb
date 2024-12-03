class Item < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :category
  belongs_to :condition
  belongs_to :estimated_shipping_date
  belongs_to :shipping_cost_responsibility
  validates :area, :category, :condition, :estimated_shipping_date, :shipping_cost_responsibility,
            numericality: { other_than: 1, message: "can't be blank" }
end
