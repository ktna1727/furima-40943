class Address < ApplicationRecord
  belongs_to :order
  validates :post_number, :municipalities, :street_address, :phone_number, :area_id, presence: true
  validates :post_number, format: { with: /\A\d{3}-\d{4}\z/, message: 'は3桁-4桁で入力してください' }
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は10から11桁で入力してください' }
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  validates :area_id, numericality: { other_than: 0, message: 'を選択してください' }
end
